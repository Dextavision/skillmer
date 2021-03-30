import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class UserPostService {
  final List<UserPost> _userPost = [
    UserPost(username: 'Dany', avatar: Icons.people_outline),
    UserPost(username: 'Schatzi', avatar: Icons.people_outline),
    UserPost(username: 'Bob', avatar: Icons.people_outline)
  ];

  List<UserPost> getUserPosts() {
    return _userPost;
  }
}
