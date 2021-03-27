import 'package:flutter/material.dart';
import 'package:skillmer/app/theme.dart';
import 'package:skillmer/views/navigation/navigation.dart';

class Skillmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillmer',
      theme: AppTheme.dark(),
      home: Navigation(),
    );
  }
}
