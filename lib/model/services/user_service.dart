import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skillmer/model/api/api.dart';
import 'package:skillmer/model/services/amplify_auth_service.dart';
import 'package:skillmer/shared/models/presigned_object.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:http/http.dart' as http;

final userProvider = Provider<UserService>((ref) => UserService());

class UserService {
  // Unique identifier for the current User
  late MySqlConnection _conn;
  String _awsUserID = '';
  late User _currentUser;

  Future<User> loadUser(MySqlConnection conn) async {
    _conn = conn;
    _awsUserID = await AWSAuthRepository.getUserID();

    User currentUser = await getUser();

    _currentUser = currentUser;

    return currentUser;
  }

  Future<String> uploadProfileImage() async {
    // Get presigned URL to upload File directly to S3
    http.Response presignedURL = await http.post(
      Uri.parse(
        API_URL,
      ),
    );

    String presignedURLResponse = presignedURL.body;
    Map<String, dynamic> presignedURLObject = jsonDecode(presignedURLResponse);
    PresignedObject uploadObject = PresignedObject.fromJson(presignedURLObject);

    // Load Asset File for testing purpose, later Image Picker
    File f = await _getImageFileFromAssets('images/dany_profile.png');

    // Upload directly to S3
    await http.put(
      Uri.parse(uploadObject.path),
      body: await f.readAsBytes(),
    );

    return ('CLOUDFRONT_DOMAIN / uploadObject.imageName');
  }

  Future<User> updateUserProfileImage(String profileImageURL) async {
    await _conn.query(
      'UPDATE User SET profileImage = ? WHERE user_id = ?;',
      [
        profileImageURL,
        _awsUserID,
      ],
    );

    User updatedUser = await getUser();

    return updatedUser;
  }

  Future<User> likePost(int postID) async {
    bool isAlreadyLiked = false;

    Results query = await _conn.query(
      'SELECT * from UserSkilledPost where user_id = ? and post_id = ?',
      [_currentUser.id, postID],
    );

    isAlreadyLiked = query.length == 1 ? true : false;

    // If already liked then dislike, otherwise like the post
    if (isAlreadyLiked) {
      await _conn.query(
        'DELETE from UserSkilledPost where user_id = ? and post_id = ?',
        [
          _currentUser.id,
          postID,
        ],
      );
    } else {
      await _conn.query(
        'INSERT into UserSkilledPost (user_id, post_id) VALUES (?, ?)',
        [
          _currentUser.id,
          postID,
        ],
      );
    }

    _currentUser.skilledPosts = await _getSkilledPostsFromUser(_currentUser.id);

    return _currentUser;
  }

  // #################
  // UTILITY FUNCTIONS
  // #################
  Future<User> getUser() async {
    User user;
    Results userQuery = await fetchUserFromDB();

    if (userQuery.length == 0) {
      user = await createUser();
    } else {
      user = userFactory(userQuery);
      // Get Bookmarked and Skilled Posts from the current User
      user.bookmarkedPosts = await _getBookmarkedPostsFromUser(user.id);
      user.skilledPosts = await _getSkilledPostsFromUser(user.id);
      // Get Count Fields
      user.postsCount = await _getPostsCount(user.id);
    }

    return user;
  }

  Future<User> createUser() async {
    await _conn.query(
      'insert into User (username, profile_image, level, posts_count, followers_count, following_count, aws_user_id) VALUES (?, ?, ?, ?, ?, ?, ?);',
      [
        'ProGamer1337',
        'https://d2kwbumlh5wa1i.cloudfront.net/190d0995-7479-4f52-badc-0b8483a4a09b.png',
        'Noob',
        0,
        0,
        0,
        _awsUserID
      ],
    );
    Results query = await fetchUserFromDB();
    User user = userFactory(query);
    return user;
  }

  Future<Results> fetchUserFromDB() async {
    Results query = await _conn.query(
      'select * from User where aws_user_id = ?;',
      [_awsUserID],
    );

    return query;
  }

  // Create User Object out of the DB Query
  static User userFactory(Results userQuery) {
    late User newUser;

    for (var user in userQuery) {
      newUser = User(
        id: user.fields['user_id'],
        username: user.fields['username'].toString(),
        level: user.fields['level'],
        profileImage: user.fields['profile_image'],
        postsCount: user.fields['posts_count'],
        followersCount: user.fields['followers_count'],
        followingCount: user.fields['following_count'],
      );
    }

    return newUser;
  }

  Future<File> _getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = await File('${(await getTemporaryDirectory()).path}/$path')
        .create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<List<int>> _getBookmarkedPostsFromUser(int userID) async {
    List<int> bookmarkedPosts = [];

    Results query = await _conn.query(
      'Select * from UserBookmarkedPost where user_id = ?',
      [
        userID,
      ],
    );

    for (var bookmark in query) {
      bookmarkedPosts.add(bookmark.fields['post_id']);
    }

    return bookmarkedPosts;
  }

  Future<List<int>> _getSkilledPostsFromUser(int userID) async {
    List<int> skilledPosts = [];

    Results query = await _conn.query(
      'Select * from UserSkilledPost where user_id = ?',
      [
        userID,
      ],
    );

    for (var skilled in query) {
      skilledPosts.add(skilled.fields['post_id']);
    }

    return skilledPosts;
  }

  Future<int> _getPostsCount(int userID) async {
    int allPostsFromUser = 0;

    Results query = await _conn.query(
      'Select * from Post where user_id = ?',
      [
        userID,
      ],
    );

    allPostsFromUser = query.length;

    return allPostsFromUser;
  }
}
