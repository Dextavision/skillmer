import 'package:flutter/material.dart';

class UserPost {
  const UserPost({
    required this.username,
    required this.avatar,
    this.textPost,
    this.hashtags,
  });

  final IconData avatar;
  final String username;
  final String? textPost;
  final List<String>? hashtags;
}
