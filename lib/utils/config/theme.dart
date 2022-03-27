import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './constants.dart';

ThemeData lightTheme() {
  return ThemeData(
    // primaryTextTheme: textTheme(),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
          fontFamily: 'Gilroy-Regular',
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        toolbarTextStyle: TextStyle(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black)),
    fontFamily: 'Gilroy-Regular',

    // textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: kPrimarySwatch,
      brightness: Brightness.light,
    scaffoldBackgroundColor: kBackground,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 0.8, color: kGrey2),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gapPadding: 5);
  OutlineInputBorder errorInputBorder = const OutlineInputBorder(
      gapPadding: 5,
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.8,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)));
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    errorBorder: errorInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Gilroy',
      // color: kBlackColor,
    ),
    bodyText2: TextStyle(
        color: kBlackColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.normal),
    // bodyMedium: TextStyle(color: kBlackColor),
  );
}

TextStyle get subHeading {
  return const TextStyle(
    fontSize: 24,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.bold,
  );
}

