import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';

class UserPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<UserPost> userPostItems = [
      UserPost(username: 'Dany', avatar: Icons.people_outline),
      UserPost(username: 'Schatzi', avatar: Icons.people_outline),
      UserPost(username: 'Bob', avatar: Icons.people_outline)
    ];

    return Row(
      children: <Widget>[
        Row(
          children: [
            ListView.builder(
              itemCount: userPostItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${userPostItems[index]}'),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
