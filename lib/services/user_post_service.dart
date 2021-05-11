import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

final userPostProvider = Provider<UserPostService>((ref) => UserPostService());

class UserPostService {
  Future<List<UserPost>> loadUserPosts(MySqlConnection conn) async {
    final userPostQuery = await conn.query('select * from Post;');

    List<UserPost> userPosts = fillUserPostList(userPostQuery);

    return userPosts;
  }

  Future<List<UserPost>> addUserPost(
      MySqlConnection conn, String postText) async {
    List<UserPost> userPosts = [];

    // Add new Post
    await conn.query(
      'INSERT INTO POST (user_id,likes,post_text) VALUES (1,0,?);',
      [postText],
    );

    // Read all posts in Database
    final userPostQuery = await conn.query('select * from Post;');

    userPosts = fillUserPostList(userPostQuery);

    return userPosts;
  }

  Future<List<UserPost>> deleteUserPost(
      MySqlConnection conn, int postID) async {
    List<UserPost> userPosts = [];

    // Add new Post
    await conn.query(
      'DELETE FROM Post where post_id = ?',
      [postID],
    );

    // Read all posts in Database
    final userPostQuery = await conn.query('select * from Post;');
    userPosts = fillUserPostList(userPostQuery);

    return userPosts;
  }

  // #################
  // UTILITY FUNCTIONS
  // #################

  List<UserPost> fillUserPostList(Results userPostQuery) {
    List<UserPost> userPosts = [];

    for (var userPost in userPostQuery) {
      userPosts.add(new UserPost(
        id: userPost.fields['post_id'],
        username: 'Dany',
        avatar: Icons.account_circle,
        textPost: userPost.fields['post_text'].toString(),
      ));
    }

    return userPosts;
  }
}
