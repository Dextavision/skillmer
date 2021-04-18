import 'package:flutter/material.dart';
import 'package:skillmer/services/user_post_service.dart';
import 'package:skillmer/shared/constants.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postTextController = new TextEditingController();

  void addPost() {
    UserPostService postService = new UserPostService();
    postService.addUserPost(postTextController.text);
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
                icon: Icon(Icons.block),
                onPressed: () {},
                color: accentColor,
              ),
            ],
          ),
          Expanded(
            child: TextField(
              controller: postTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Whats up?',
              ),
              maxLines: null,
            ),
          ),
          Divider(),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.control_point),
                onPressed: () {
                  addPost();
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
