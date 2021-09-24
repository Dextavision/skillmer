import 'package:flutter/material.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/views/user_post/widgets/post_comment.dart';

class CommentSection extends StatelessWidget {
  final UserPost userPost;

  const CommentSection({required this.userPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
            children: const [
              Expanded(
                child: PostComment(),
              ),
            ],
          );
        },
      ),
    );
  }
}
