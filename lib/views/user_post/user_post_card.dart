import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/view_model/providers/user_post_provider.dart';
import 'package:skillmer/views/user_post/user_post_icon_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPostCard extends ConsumerWidget {
  final UserPost userPost;

  UserPostCard({required this.userPost});

  void _selectedPopupMenu(BuildContext context, int item) {
    switch (item) {
      case 0:
        _deleteUserPost(context);
        break;

      case 1:
        _editUserPost();
        break;

      default:
        break;
    }
  }

  void _deleteUserPost(BuildContext context) {
    context.read(postProviderAsync.notifier).deleteUserPost(userPost.id);
  }

  void _editUserPost() {}

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        color: primaryColor,
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.white, width: 0.1),
            // borderRadius: BorderRadius.circular(4.0),
            ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 1.0,
                  ),
                  child: Container(
                    width: 20.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          userPost.profileImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    userPost.username,
                  ),
                ),
                PopupMenuButton<int>(
                  color: accentColor,
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Delete"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Edit"),
                    ),
                  ],
                  onSelected: (item) => {
                    _selectedPopupMenu(context, item),
                  },
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
            Visibility(
              child: Divider(
                color: accentColor,
              ),
              visible: userPost.hashtags != null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userPost.hashtags != null
                    ? Text(
                        userPost.hashtags!.join(","),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    : Text(''),
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
