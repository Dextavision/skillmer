import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';

class BottomBar extends StatelessWidget {
  final Function onTapped;
  final int selectedIndex;
  BottomBar({required this.onTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        // BottomNavigationBarItem(
        //   label: "Search",
        //   icon: Icon(Icons.search),
        // ),
        BottomNavigationBarItem(
          label: "Create",
          icon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          label: "News",
          icon: Icon(Icons.new_releases),
        ),
      ],
      onTap: (selectedIndex) => onTapped(selectedIndex),
      currentIndex: selectedIndex,
    );
  }
}
