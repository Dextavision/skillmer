import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/models/user_model.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/profile/profile_tabs.dart';

class Profile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<User> user = watch(userProviderAsync);

    return user.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Oops, something unexpected happened'),
      data: (user) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Profile",
                        style: profileText,
                      ),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/profile-settings',
                          arguments: user,
                        );
                      },
                    ),
                  ),
                ],
              ),
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
              Container(
                child: Text(
                  user.username,
                  style: profileText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Divider(
                      color: accentColor,
                      indent: 120.0,
                      endIndent: 120.0,
                    ),
                    Container(
                      child: Text(
                        user.rank,
                        style: profileText,
                      ),
                    ),
                    Divider(
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
                        Text(
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
                        Text(
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
                        Text(
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
              Expanded(
                child: ProfileTabs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
