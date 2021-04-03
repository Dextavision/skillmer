import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';

class UserPostCard extends StatelessWidget {
  final String username;
  final IconData avatar;
  final String? textPost;

  UserPostCard({required this.username, required this.avatar, this.textPost});

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
                    avatar,
                  ),
                ),
                Text(
                  username,
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
                      child: Text(textPost ?? ''),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
