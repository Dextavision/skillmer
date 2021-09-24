import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillmer/shared/constants.dart';

class AppTheme {
  static const _kPrimaryColor = primaryColor;
  static const _kAccentColor = accentColor;

  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _kPrimaryColor,
      colorScheme: const ColorScheme.dark(
        secondary: _kAccentColor,
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
    );
  }

  static _getTextTheme({Brightness brightness = Brightness.dark}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.quicksand(),
      headline2: GoogleFonts.quicksand(),
      headline3: GoogleFonts.quicksand(),
      headline4: GoogleFonts.quicksand(),
      headline5: GoogleFonts.quicksand(),
      headline6: GoogleFonts.quicksand(),
      bodyText2: GoogleFonts.quicksand(),
    );
  }
}
