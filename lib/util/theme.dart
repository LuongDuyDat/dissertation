import 'package:flutter/material.dart';

Color primaryLightColor = const Color(0xFF1E4B99);
Color backgroundLightColor = const Color(0xFFC0CAD4);
Color secondaryLightColor = const Color(0xFF189DC3);
Color backgroundLightColor2 = Colors.white;
Color textLightColor = Colors.black;
Color hintText = primaryLightColor.withOpacity(0.5);

final appThemeLight = ThemeData(
  primaryColor: primaryLightColor,
  scaffoldBackgroundColor: backgroundLightColor,
  highlightColor: secondaryLightColor,
  fontFamily: 'Montserrat',

  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
      color: textLightColor,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: textLightColor,
    ),
    displaySmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: textLightColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: textLightColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: textLightColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: textLightColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: textLightColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: textLightColor,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: hintText
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: hintText,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: hintText,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: backgroundLightColor2,
    centerTitle: false,
    titleSpacing: 10,
    titleTextStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
      color: primaryLightColor,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLightColor,
      shadowColor: Colors.transparent,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      side: BorderSide(color: primaryLightColor, width: 1.5),
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: backgroundLightColor2,
      ),
    ),
  ),
);