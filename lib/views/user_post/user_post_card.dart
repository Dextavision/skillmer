import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/view_model/providers/user_post_provider.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/user_post/widgets/user_post_icon_list.dart';
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

  void _deleteUserPost(BuildContext context) async {
    context.read(postProviderAsync.notifier).deleteUserPost(userPost.id);
    context.read(userProviderAsync).data!.value.postsCount--;

    final snackBar = SnackBar(
      content: Text(
        'Successfully deleted Item!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: accentColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _editUserPost() {}

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bool isOwnPost =
        context.read(userProviderAsync).data!.value.id == userPost.userID;

    Color getPostLevelColor() {
      bool kek = userPost.likes < 20;
      bool rookie = userPost.likes >= 20 && userPost.likes < 100;
      bool skiller = userPost.likes >= 100 && userPost.likes < 500;
      bool progamer = userPost.likes >= 500 && userPost.likes < 2000;
      bool godgamer = userPost.likes >= 2000 && userPost.likes < 10000;
      bool legendary = userPost.likes >= 10000 && userPost.likes < 50000;
      bool skillmer = userPost.likes >= 50000;

      if (kek) return Colors.transparent;
      if (rookie) return Colors.white;
      if (skiller) return Colors.green;
      if (progamer) return Colors.blue;
      if (godgamer) return Colors.deepPurple;
      if (legendary) return Colors.amber;
      if (skillmer) return accentColor;

      return Colors.transparent;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        color: primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: getPostLevelColor(), width: 0.1),
          borderRadius: BorderRadius.circular(4.0),
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
                Visibility(
                  child: PopupMenuButton<int>(
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
                  visible: isOwnPost,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
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
              visible: userPost.hashtags!.length > 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userPost.hashtags!.length > 0
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
            UserPostIconList(
              userPost: userPost,
            )
          ],
        ),
      ),
    );
  }
}
