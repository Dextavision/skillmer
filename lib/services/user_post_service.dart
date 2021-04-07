import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class UserPostService {
  final List<UserPost> _userPost = [
    UserPost(
        username: 'Dany',
        avatar: Icons.people_outline,
        textPost: "Rein in die Olga!",
        hashtags: ["#CoD #PS5"]),
    UserPost(
        username: 'Schatzi',
        avatar: Icons.people_outline,
        textPost: "Nur noch einen Schrein!",
        hashtags: ["#Zelda:BotW #Switch"]),
    UserPost(
      username: 'Bob',
      avatar: Icons.people_outline,
      textPost: "Die Story ist einfach nice!",
      hashtags: ["#FinalFantasy7Remake #PS4"],
    ),
    UserPost(
      username: 'Toby',
      avatar: Icons.people_outline,
      textPost: "99er Messi, da seh ich mich!",
      hashtags: ["#Fifa21 #PS5"],
    ),
  ];

  List<UserPost> getUserPosts() {
    return _userPost;
  }
}
