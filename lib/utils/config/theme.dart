import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './constants.dart';

class Themes {
  static ThemeData themeData() {
    return ThemeData(
      primaryTextTheme: GoogleFonts.montserratTextTheme(),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
          toolbarTextStyle: GoogleFonts.montserrat(),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: GoogleFonts.montserratTextTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // primarySwatch: kPrimarySwatch,
      brightness: Brightness.light,
      scaffoldBackgroundColor: kBackground,
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gapPadding: 5);
    OutlineInputBorder errorInputBorder = const OutlineInputBorder(
        // gapPadding: 5,
        borderSide: BorderSide(
          color: Colors.red,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)));
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      errorBorder: errorInputBorder,
    );
  }
}
