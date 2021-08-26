import 'package:flutter/material.dart';
import 'constants.dart';

class Utility {
  static Color getPostLevelColor(int likes) {
    bool kek = likes < 20;
    bool rookie = likes >= 20 && likes < 100;
    bool skiller = likes >= 100 && likes < 500;
    bool progamer = likes >= 500 && likes < 2000;
    bool godgamer = likes >= 2000 && likes < 10000;
    bool legendary = likes >= 10000 && likes < 50000;
    bool skillmer = likes >= 50000;

    if (kek) return Colors.transparent;
    if (rookie) return Colors.white;
    if (skiller) return Colors.green;
    if (progamer) return Colors.blue;
    if (godgamer) return Colors.deepPurple;
    if (legendary) return Colors.amber;
    if (skillmer) return accentColor;

    return Colors.transparent;
  }
}
