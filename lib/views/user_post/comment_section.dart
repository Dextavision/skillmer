import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/views/user_post/widgets/comment.dart';

class CommentSection extends StatelessWidget {
  final UserPost userPost;

  const CommentSection(this.userPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: Comment(),
              ),
            ],
          );
        },
      ),
    );
  }
}
