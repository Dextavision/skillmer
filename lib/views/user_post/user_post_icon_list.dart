import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';

class UserPostIconList extends StatefulWidget {
  @override
  _UserPostIconListState createState() => _UserPostIconListState();
}

class _UserPostIconListState extends State<UserPostIconList> {
  Color _shareIconColor = Colors.white;
  Color _bookmarkIconColor = Colors.white;
  Color _levelUpIconColor = Colors.white;

  _shareClicked() {
    setState(() {
      if (_shareIconColor == Colors.white) {
        _shareIconColor = accentColor;
      } else {
        _shareIconColor = Colors.white;
      }
    });
  }

  _bookmarkClicked() {
    setState(() {
      if (_bookmarkIconColor == Colors.white) {
        _bookmarkIconColor = accentColor;
      } else {
        _bookmarkIconColor = Colors.white;
      }
    });
  }

  _levelUpClicked() {
    setState(() {
      if (_levelUpIconColor == Colors.white) {
        _levelUpIconColor = accentColor;
      } else {
        _levelUpIconColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.ios_share),
          onPressed: () {
            _shareClicked();
          },
          color: _shareIconColor,
          iconSize: 20.0,
        ),
        IconButton(
          icon: Icon(Icons.bookmark_outline),
          onPressed: () {
            _bookmarkClicked();
          },
          color: _bookmarkIconColor,
          iconSize: 20.0,
        ),
        IconButton(
          icon: Icon(Icons.messenger_outline_sharp),
          onPressed: () {},
          color: Colors.white,
          iconSize: 20.0,
        ),
        IconButton(
          icon: Icon(Icons.plus_one_outlined),
          onPressed: () {
            _levelUpClicked();
          },
          color: _levelUpIconColor,
          iconSize: 20.0,
        ),
      ],
    );
  }
}
