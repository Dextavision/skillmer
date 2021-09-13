import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';

class UserPostIconList extends ConsumerWidget {
  final UserPost userPost;

  const UserPostIconList({required this.userPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<User> user = watch(userProviderAsync);

    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (user) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            onPressed: () {},
            iconSize: 20.0,
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              context
                  .read(userProviderAsync.notifier)
                  .bookmarkPost(userPost.id);
            },
            iconSize: 20.0,
            color: user.bookmarkedPosts.contains(userPost.id)
                ? accentColor
                : Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.messenger_outline_sharp),
            onPressed: () {
              Navigator.pushNamed(context, '/comments', arguments: userPost);
            },
            color: Colors.white,
            iconSize: 20.0,
          ),
          IconButton(
            icon: const Icon(Icons.plus_one_outlined),
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
