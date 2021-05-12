import 'package:flutter/material.dart';
import 'package:skillmer/app/theme.dart';
import 'package:skillmer/views/navigation/navigation.dart';
import 'package:skillmer/views/profile/profile.dart';

class Skillmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillmer',
      theme: AppTheme.dark(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Navigation(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/profile': (context) => Profile(),
      },
    );
  }
}
