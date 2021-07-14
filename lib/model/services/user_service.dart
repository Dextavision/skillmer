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
  String awsUserID = '';

  Future<User> loadUser(MySqlConnection conn) async {
    awsUserID = await AWSAuthRepository.getUserID();

    User currentUser = await getUser(conn);

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

  Future<User> updateUserProfileImage(
      MySqlConnection conn, String profileImageURL) async {
    await conn.query(
      'UPDATE User SET profileImage = ? WHERE user_id = ?;',
      [
        profileImageURL,
        awsUserID,
      ],
    );

    User updatedUser = await getUser(conn);

    return updatedUser;
  }

  // #################
  // UTILITY FUNCTIONS
  // #################
  Future<User> getUser(MySqlConnection conn) async {
    User user;
    Results userQuery = await fetchUserFromDB(conn);

    if (userQuery.length == 0) {
      user = await createUser(conn);
    } else {
      user = userFactory(userQuery);
    }
    return user;
  }

  Future<User> createUser(MySqlConnection conn) async {
    await conn.query(
      'insert into user (username, profile_image, level, posts_count, followers_count, following_count, aws_user_id) VALUES (?, ?, ?, ?, ?, ?, ?);',
      [
        'ProGamer1337',
        'https://d2kwbumlh5wa1i.cloudfront.net/190d0995-7479-4f52-badc-0b8483a4a09b.png',
        'Noob',
        0,
        0,
        0,
        awsUserID
      ],
    );
    Results query = await fetchUserFromDB(conn);
    User user = userFactory(query);
    return user;
  }

  Future<Results> fetchUserFromDB(MySqlConnection conn) async {
    Results query = await conn.query(
      'select * from User where aws_user_id = ?;',
      [awsUserID],
    );

    return query;
  }

  // Create User Object out of the DB Query
  User userFactory(Results userQuery) {
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
}
