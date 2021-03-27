import 'package:flutter/material.dart';
import 'package:skillmer/views/bottom_bar/bottom_bar.dart';
import 'package:skillmer/views/home/home.dart';
import 'package:skillmer/views/news/news.dart';
import 'package:skillmer/views/search/search.dart';
import 'package:skillmer/views/user_post/add_post.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Skillmer'),
        leading: Icon(
          Icons.supervised_user_circle_rounded,
        ),
      ),
      body: _skillmerScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomBar(
        onTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
