import 'package:flutter/material.dart';

class UserPost {
  UserPost({
    required this.id,
    required this.username,
    required this.avatar,
    this.textPost,
    this.hashtags,
  });

  int id;
  IconData avatar;
  String username;
  String? textPost;
  List<String>? hashtags;
}
