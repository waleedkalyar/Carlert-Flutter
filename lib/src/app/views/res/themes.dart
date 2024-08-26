// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

var appLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: appWhite,
  indicatorColor: appBlack,
  cardColor: appWhite,
  primaryColorDark: appBlack,
  primaryColorLight: appGrayBackground,
  hintColor: appGray,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: appBlack,
  ),
  primaryTextTheme: TextTheme(
    displaySmall: GoogleFonts.lato(
        color: appBlack, fontSize: 10, fontWeight: FontWeight.w400),
    displayMedium: GoogleFonts.lato(
        color: appBlack, fontSize: 12, fontWeight: FontWeight.w600),
    displayLarge: GoogleFonts.lato(
        color: appBlack, fontSize: 16, fontWeight: FontWeight.w600),
    headlineLarge: GoogleFonts.lato(
        color: appBlack, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.lato(
        color: appBlack, fontSize: 18, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.lato(
        color: appBlack, fontSize: 15, fontWeight: FontWeight.w400),
    bodyLarge: GoogleFonts.lato(
        color: appBlack, fontSize: 24, fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.lato(
        color: appBlack, fontSize: 20, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.lato(
        color: appBlack, fontSize: 16, fontWeight: FontWeight.w400),
  ),
  buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: appGray,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      disabledColor: appGray),
);

var appDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: appBlack,
  indicatorColor: appWhite,
  cardColor: appGrayDark,
  primaryColorDark: appGrayDark,
  primaryColorLight: appGrayDark,
  hintColor: appGray,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: appWhite,
  ),
  primaryTextTheme: TextTheme(
    displaySmall: GoogleFonts.lato(
        color: appWhite, fontSize: 10, fontWeight: FontWeight.w400),
    displayMedium: GoogleFonts.lato(
        color: appWhite, fontSize: 12, fontWeight: FontWeight.w600),
    displayLarge: GoogleFonts.lato(
        color: appWhite, fontSize: 16, fontWeight: FontWeight.w600),
    headlineLarge: GoogleFonts.lato(
        color: appWhite, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.lato(
        color: appWhite, fontSize: 18, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.lato(
        color: appWhite, fontSize: 15, fontWeight: FontWeight.w400),
    bodyLarge: GoogleFonts.lato(
        color: appWhite, fontSize: 24, fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.lato(
        color: appWhite, fontSize: 20, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.lato(
        color: appWhite, fontSize: 16, fontWeight: FontWeight.w400),
  ),
  buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: appGray,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      disabledColor: appGray),
);