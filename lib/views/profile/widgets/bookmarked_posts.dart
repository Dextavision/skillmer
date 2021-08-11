import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/user_post/user_post_card.dart';

class BookmarkedPosts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(userProviderAsync);

    return user.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Text('Oops, something unexpected happened'),
      data: (bookmarkedPosts) => ListView.builder(
        itemCount: bookmarkedPosts.bookmarkedPostsList.length | 0,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: UserPostCard(
                  userPost: bookmarkedPosts.bookmarkedPostsList[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
