import 'package:flutter/material.dart';

class UserPost {
  const UserPost({required this.username, required this.avatar, this.textPost});

  final IconData avatar;
  final String username;
  final String? textPost;
}
