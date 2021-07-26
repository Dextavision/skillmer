import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';

// TODO: Implement State to see which Posts are skilled and or bookmarked by the current user, maybe new Provider for Skilled and Bookmarked State
class UserPostIconList extends ConsumerWidget {
  final UserPost userPost;

  UserPostIconList({required this.userPost});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<User> user = watch(userProviderAsync);

    return user.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Oops, something unexpected happened'),
      data: (user) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.ios_share),
            onPressed: () {},
            iconSize: 20.0,
          ),
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: () {},
            iconSize: 20.0,
          ),
          IconButton(
            icon: Icon(Icons.messenger_outline_sharp),
            onPressed: () {},
            color: Colors.white,
            iconSize: 20.0,
          ),
          IconButton(
            icon: Icon(Icons.plus_one_outlined),
            onPressed: () {
              context.read(userProviderAsync.notifier).likePost(userPost.id);
            },
            iconSize: 20.0,
            color: user.skilledPosts.contains(userPost.id)
                ? accentColor
                : Colors.white,
          ),
        ],
      ),
    );
  }
}
