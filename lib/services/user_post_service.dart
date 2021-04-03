import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class UserPostService {
  final List<UserPost> _userPost = [
    UserPost(
        username: 'Dany',
        avatar: Icons.people_outline,
        textPost: "Rein in die Olga!"),
    UserPost(
        username: 'Schatzi',
        avatar: Icons.people_outline,
        textPost: "Skyyr skyyyr"),
    UserPost(
      username: 'Bob',
      avatar: Icons.people_outline,
      textPost: "blub!",
    )
  ];

  List<UserPost> getUserPosts() {
    return _userPost;
  }
}
