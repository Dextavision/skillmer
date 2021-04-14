import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';

class AddPost extends StatelessWidget {
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
                onPressed: () {},
                iconSize: 40.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
