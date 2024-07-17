import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

base class ThemeStyle {
  //TextFormField Text Style
  static TextStyle formFieldTxtStyle({
    Color txtColor = lightSecondaryColor,
    double fontSize = 19,
  }) {
    return GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: txtColor,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
  }

  // Active Index or Active Tile Text Colors //
  static TextStyle bodyMediumActiveIndexTextStyle = GoogleFonts.lato(
    decoration: TextDecoration.none,
    color: ThemeStyle.darkHighLightColor,
    fontSize: 17,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodySmallActiveIndexTextStyle = GoogleFonts.montserrat(
    decoration: TextDecoration.none,
    color: ThemeStyle.darkHighLightColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  //Upper box shahdow
  static const double blurRadius = 4.0;
  static const double spreadRadius = 2.0;

  //Upper box shadow Offset
  static const Offset upperOffset = Offset(2.5, 4.0);

  //Lower box Shahdow offset
  static const Offset lowerOffset = Offset(4.0, 6.0);

  // Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(12.0);

  // Light Theme Colors
  static const lightScaffoldBackgroundColor =
      Color.fromARGB(255, 236, 239, 241);
  static const lightPrimaryColor = Color.fromARGB(255, 68, 137, 255);
  static const lightSecondaryColor = Color.fromRGBO(33, 33, 33, 0.9);
  static const lightHighLightColor = Color.fromARGB(255, 0, 0, 0);
  static const lightFocusColor = Color.fromARGB(255, 103, 58, 183);
  static const lightOnErrorColor = Color.fromARGB(255, 244, 67, 54);
  static const lightCardColor = Color.fromARGB(255, 255, 255, 255);
  static const lightIconColor = Color.fromARGB(207, 101, 98, 98);
  static const lightIndicatorColor = Color.fromARGB(255, 145, 144, 144);
  static const lightUpperShahdowColor = Color.fromARGB(213, 208, 207, 207);
  static const lightLowerShahdowColor = Color.fromARGB(68, 255, 255, 255);

  // Dark Theme Colors
  static const darkScaffoldBackgroundColor = Color.fromARGB(255, 33, 33, 33);
  static const darkPrimaryColor = Color.fromARGB(255, 59, 128, 248);
  static const darkSecondaryColor = Color.fromARGB(214, 255, 255, 255);
  static const darkHighLightColor = Color.fromARGB(255, 255, 255, 255);
  static const darkFocusColor = Color.fromARGB(255, 120, 48, 243);
  static const darkOnErrorColor = Color.fromARGB(255, 244, 67, 54);
  static const darkCardColor = Color.fromARGB(255, 0, 0, 0);
  static const darkIconColor = Color.fromARGB(207, 101, 98, 98);
  static const darkIndicatorColor = Color.fromARGB(255, 145, 144, 144);
  static const darkUpperShahdowColor = Color.fromARGB(31, 202, 200, 200);
  static const darkLowerShahdowColor = Color.fromARGB(124, 0, 0, 0);
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ThemeStyle.lightScaffoldBackgroundColor,
  primaryColor: ThemeStyle.lightPrimaryColor,
  focusColor: ThemeStyle.lightFocusColor,
  highlightColor: ThemeStyle.lightHighLightColor,
  hintColor: ThemeStyle.lightIndicatorColor,
  secondaryHeaderColor: ThemeStyle.lightSecondaryColor,
  cardColor: const Color.fromARGB(255, 236, 239, 241),
  indicatorColor: ThemeStyle.lightOnErrorColor,
  splashColor: const Color.fromARGB(255, 236, 239, 241),
  iconTheme: const IconThemeData(color: ThemeStyle.lightIconColor, size: 18),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.lightHighLightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.lightFocusColor,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.lato(
      decoration: TextDecoration.none,
      color: ThemeStyle.lightSecondaryColor,
      fontSize: 17,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.lightIndicatorColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ThemeStyle.darkScaffoldBackgroundColor,
  primaryColor: ThemeStyle.darkFocusColor,
  focusColor: ThemeStyle.darkPrimaryColor,
  highlightColor: ThemeStyle.darkHighLightColor,
  hintColor: ThemeStyle.darkIndicatorColor,
  secondaryHeaderColor: ThemeStyle.darkSecondaryColor,
  cardColor: ThemeStyle.darkScaffoldBackgroundColor,
  indicatorColor: ThemeStyle.lightOnErrorColor,
  splashColor: ThemeStyle.darkScaffoldBackgroundColor,
  iconTheme: const IconThemeData(color: ThemeStyle.darkIconColor, size: 18),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.darkSecondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.darkHighLightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.darkFocusColor,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.darkSecondaryColor,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: ThemeStyle.darkIndicatorColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
);
