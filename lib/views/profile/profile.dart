import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/profile/profile_tabs.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<User> user = watch(userProviderAsync);

    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (user) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: scaffoldBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/profile-settings',
                  arguments: user,
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: 90.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      user.profileImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                user.username,
                style: profileText,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    const Divider(
                      color: accentColor,
                      indent: 120.0,
                      endIndent: 120.0,
                    ),
                    Text(
                      user.level,
                      style: profileText,
                    ),
                    const Divider(
                      color: accentColor,
                      indent: 120.0,
                      endIndent: 120.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Posts',
                          style: profileText,
                        ),
                        Text(
                          user.postsCount.toString(),
                          style: profileNumbers,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Followers',
                          style: profileText,
                        ),
                        Text(
                          user.followersCount.toString(),
                          style: profileNumbers,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Follows',
                          style: profileText,
                        ),
                        Text(
                          user.followingCount.toString(),
                          style: profileNumbers,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: ProfileTabs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
