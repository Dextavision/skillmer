import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/views/profile/widgets/bookmarked_posts.dart';
import 'package:skillmer/views/profile/widgets/skilled_posts.dart';
import 'package:skillmer/views/user_post/user_post_list.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Items',
                  ),
                  Tab(
                    text: 'Skilled',
                  ),
                  Tab(
                    text: 'Bookmarked',
                  ),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostList(),
            SkilledPosts(),
            BookmarkedPosts(),
          ],
        ),
      ),
    );
  }
}
