import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/views/profile/profile_tabs.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.pushNamed(context, '/profile-settings');
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Icon(
                Icons.account_circle_sharp,
                size: 110.0,
              ),
            ),
            Container(
              child: Text(
                'Dextavision',
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
                      'Elite',
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
                        '1337',
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
                        '69',
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
                        '42',
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
    );
  }
}
