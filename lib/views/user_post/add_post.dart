import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/view_model/providers/user_post_provider.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postTextController = TextEditingController();

  void addUserPost(BuildContext context) {
    if (postTextController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text(
          'Ups! No content was provided!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: accentColor,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    context
        .read(postProviderAsync.notifier)
        .addUserPost(postTextController.text);
    context.read(userProviderAsync).data!.value.postsCount++;

    Navigator.pushNamed(
      context,
      '/',
    );

    const snackBar = SnackBar(
      content: Text(
        'Successfully added Item!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: accentColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.block),
                onPressed: () {},
                color: accentColor,
              ),
            ],
          ),
          Expanded(
            child: TextField(
              controller: postTextController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Whats up?',
              ),
              maxLines: null,
            ),
          ),
          const Divider(),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.video_call),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.control_point),
                onPressed: () {
                  addUserPost(context);
                },
                iconSize: 40.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
