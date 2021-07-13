import 'package:flutter/material.dart';
import 'package:skillmer/view_model/providers/user_provider.dart';
import 'package:skillmer/views/bottom_bar/bottom_bar.dart';
import 'package:skillmer/views/home/home.dart';
import 'package:skillmer/views/news/news.dart';
import 'package:skillmer/views/search/search.dart';
import 'package:skillmer/views/user_post/add_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _skillmerScreens = <Widget>[
    Home(),
    Search(),
    AddPost(),
    News()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Is Null when starting app, need to find another way to access it here
    final String profileImage =
        context.read(userProviderAsync).data!.value.profileImage;

    return Scaffold(
      appBar: AppBar(
        title: Text('Skillmer'),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage('assets/images/Skillmer.png'),
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              width: 40,
              height: 20,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    profileImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
        elevation: 0,
      ),
      body: _skillmerScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomBar(
        onTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
