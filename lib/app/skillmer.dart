import 'package:flutter/material.dart';
import 'package:skillmer/app/theme.dart';
import 'package:skillmer/views/navigation/navigation.dart';
import 'package:skillmer/views/profile/profile.dart';
import 'package:skillmer/views/profile/profile_settings.dart';

class Skillmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillmer',
      theme: AppTheme.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Navigation(),
        '/profile': (context) => Profile(),
        '/profile-settings': (context) => ProfileSettings()
      },
    );
  }
}
