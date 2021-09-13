import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/user_post/user_post_card.dart';

class SkilledPosts extends ConsumerWidget {
  const SkilledPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(userProviderAsync);

    return user.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (skilledPost) => ListView.builder(
        itemCount: skilledPost.skilledPostsList.length | 0,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: UserPostCard(
                  userPost: skilledPost.skilledPostsList[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
