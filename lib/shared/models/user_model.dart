import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.profileImage,
    required this.rank,
    this.postsCount = 0,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  int id;
  String username;
  String profileImage;
  String rank;
  int postsCount;
  int followersCount;
  int followingCount;
}
