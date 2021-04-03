import 'package:flutter/material.dart';
import 'package:skillmer/services/user_post_service.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/views/user_post/user_post_card.dart';

class UserPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserPostService userPostService = UserPostService();

    final List<UserPost> userPostItems = userPostService.getUserPosts();

    return ListView.builder(
      itemCount: userPostItems.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: UserPostCard(
                username: userPostItems[index].username,
                avatar: userPostItems[index].avatar,
                textPost: userPostItems[index].textPost,
              ),
            ),
          ],
        );
      },
    );
  }
}
