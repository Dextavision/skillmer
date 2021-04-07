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
            child: Text(
              "Body",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.add_alert),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
