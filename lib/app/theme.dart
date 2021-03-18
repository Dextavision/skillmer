import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillmer/shared/constants.dart';

class AppTheme {
  static final _primaryColor = primaryColor;
  static final _accentColor = accentColor;

  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
    );
  }

  static _getTextTheme({Brightness brightness = Brightness.dark}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.gugi(),
      headline2: GoogleFonts.gugi(),
      headline3: GoogleFonts.gugi(),
      headline4: GoogleFonts.gugi(),
      headline5: GoogleFonts.gugi(),
      headline6: GoogleFonts.gugi(),
    );
  }
}
