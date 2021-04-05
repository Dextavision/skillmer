import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/views/user_post/user_post_icon_list.dart';

class UserPostCard extends StatelessWidget {
  final UserPost userPost;

  UserPostCard({required this.userPost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Card(
        elevation: 7,
        color: primaryColor,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Icon(
                    userPost.avatar,
                  ),
                ),
                Text(
                  userPost.username,
                ),
              ],
            ),
            Divider(
              color: accentColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Container(
                      height: 60.0,
                      child: Text(userPost.textPost ?? ''),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: accentColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userPost.hashtags!.join(","),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Divider(
              color: accentColor,
            ),
            UserPostIconList()
          ],
        ),
      ),
    );
  }
}
