import 'package:flutter/material.dart';

class UserPostCard extends StatelessWidget {
  final String username;
  final IconData avatar;

  UserPostCard({required this.username, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            avatar,
          ),
          Text(
            username,
          ),
        ],
      ),
    );
  }
}
