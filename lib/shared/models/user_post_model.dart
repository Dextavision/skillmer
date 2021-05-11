import 'package:flutter/material.dart';

class UserPost {
  const UserPost({
    required this.id,
    required this.username,
    required this.avatar,
    this.textPost,
    this.hashtags,
  });

  final int id;
  final IconData avatar;
  final String username;
  final String? textPost;
  final List<String>? hashtags;
}
