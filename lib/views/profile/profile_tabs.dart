import 'package:flutter/material.dart';
import 'package:skillmer/views/user_post/user_post_list.dart';

class ProfileTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
        body: TabBarView(
          children: [
            UserPostList(),
            Text(
              'TODO: Posts user gave XP to',
            ),
            Text(
              'TODO: Posts user bookmarked',
            ),
          ],
        ),
      ),
    );
  }
}
