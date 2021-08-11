import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/model/services/user_service.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

final userPostProvider = Provider<UserPostService>((ref) => UserPostService());

class UserPostService {
  late MySqlConnection _conn;

  Future<List<UserPost>> loadUserPosts(MySqlConnection conn) async {
    _conn = conn;

    final userPostQuery = await _conn.query('select * from Post;');

    List<UserPost> userPosts = await _fillUserPostList(userPostQuery);

    return userPosts;
  }

  Future<List<UserPost>> addUserPost(String postText, int userID) async {
    List<UserPost> userPosts = [];

    // Add new Post
    await _conn.query(
      'INSERT INTO POST (user_id,likes,post_text) VALUES (?,0,?);',
      [userID, postText],
    );

    // Read all posts in Database
    Results userPostQuery = await _conn.query('select * from Post;');

    userPosts = await _fillUserPostList(userPostQuery);

    return userPosts;
  }

  Future<List<UserPost>> deleteUserPost(int postID) async {
    List<UserPost> userPosts = [];

    // Delete Post
    await _conn.query(
      'DELETE FROM Post where post_id = ?',
      [postID],
    );

    // Read all posts in Database
    Results userPostQuery = await _conn.query('select * from Post;');
    userPosts = await _fillUserPostList(userPostQuery);

    return userPosts;
  }

  // #################
  // UTILITY FUNCTIONS
  // #################

  Future<List<UserPost>> getSkilledPostsFromUser(
      List<int> postIDs, MySqlConnection conn) async {
    List<UserPost> skilledPosts = [];
    _conn = conn;

    await Future.forEach(postIDs, ((id) async {
      Results query = await _conn.query(
        'SELECT * FROM Post where post_id = ?',
        [id],
      );

      UserPost skilledPost = (await _fillUserPostList(query)).first;
      skilledPosts.add(skilledPost);
    }));

    return skilledPosts;
  }

  Future<List<UserPost>> getBookmarkedPostsFromUser(
      List<int> postIDs, MySqlConnection conn) async {
    List<UserPost> bookmarkedPosts = [];
    _conn = conn;

    await Future.forEach(postIDs, ((id) async {
      Results query = await _conn.query(
        'SELECT * FROM Post where post_id = ?',
        [id],
      );

      UserPost bookmarkedPost = (await _fillUserPostList(query)).first;
      bookmarkedPosts.add(bookmarkedPost);
    }));

    return bookmarkedPosts;
  }

  Future<List<UserPost>> _fillUserPostList(Results userPostQuery) async {
    List<UserPost> userPosts = [];

    for (var userPost in userPostQuery) {
      // Get User from Post
      int userID = userPost.fields['user_id'];
      User user = await _getUserFromPost(userID);

      // Get Hashtags to Posts
      List<String> hashtags = [];
      int postID = userPost.fields['post_id'];
      hashtags = await _getHashtagsFromPost(postID);

      userPosts.add(
        new UserPost(
          id: postID,
          userID: userID,
          username: user.username,
          profileImage: user.profileImage,
          textPost: userPost.fields['post_text'].toString(),
          postImage: userPost.fields['post_image'].toString(),
          likes: userPost.fields['likes'] ?? 0,
          hashtags: hashtags,
        ),
      );
    }

    return userPosts;
  }

  Future<User> _getUserFromPost(int userID) async {
    Results query = await _conn.query(
      'Select * FROM User where user_id = ?',
      [userID],
    );

    User user = UserService.userFactory(query);

    return user;
  }

  Future<List<String>> _getHashtagsFromPost(int postID) async {
    List<String> hashtags = [];

    Results query = await _conn.query(
      'Select * FROM PostHashtag where post_id = ?',
      [postID],
    );

    for (var hashtag in query) {
      hashtags.add(hashtag.fields['hashtag']);
    }

    return hashtags;
  }
}
