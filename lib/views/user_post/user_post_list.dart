import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/providers/providers.dart';
import 'package:skillmer/shared/models/user_post_model.dart';
import 'package:skillmer/views/user_post/user_post_card.dart';

class UserPostList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<List<UserPost>> userPostItems = watch(postProviderAsync);

    return userPostItems.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Oops, something unexpected happened'),
      data: (userPost) => ListView.builder(
        itemCount: userPost.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: UserPostCard(
                  userPost: userPost[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
