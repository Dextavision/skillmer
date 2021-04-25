import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

final userPostProvider = Provider<UserPostService>((ref) => UserPostService());

class UserPostService {
  Future<List<UserPost>> loadUserPosts(MySqlConnection conn) async {
    final userPostQuery = await conn.query('select * from Post;');
    List<UserPost> userPosts = [];

    for (var userPost in userPostQuery) {
      userPosts.add(new UserPost(
        username: 'Dany',
        avatar: Icons.account_circle,
        textPost: userPost.fields['post_text'].toString(),
      ));
    }

    return userPosts;
  }

  void addUserPost(String postText) async {
    // TODO: UserService getting Name and ID of current User
    // await _conn.query(
    //   'INSERT INTO POST (user_id,likes,post_text) VALUES (1,0,?);',
    //   [postText],
    // );
  }
}
