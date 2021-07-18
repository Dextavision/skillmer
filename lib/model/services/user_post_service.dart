import 'package:flutter/material.dart';
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

    // Add new Post
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

  Future<List<UserPost>> _fillUserPostList(Results userPostQuery) async {
    List<UserPost> userPosts = [];

    for (var userPost in userPostQuery) {
      int userID = userPost.fields['user_id'];
      User user = await _getUserFromPost(userID);
      userPosts.add(new UserPost(
        id: userPost.fields['post_id'],
        username: user.username,
        profileImage: user.profileImage,
        textPost: userPost.fields['post_text'].toString(),
      ));
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
}
