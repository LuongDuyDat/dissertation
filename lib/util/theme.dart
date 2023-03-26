import 'package:flutter/material.dart';

Color primaryLightColor = const Color(0xFF1E4B99);
Color backgroundLightColor = const Color(0xFFC0CAD4);
Color secondaryLightColor = const Color(0xFF189DC3);
Color backgroundLightColor2 = Colors.white;
Color hintText = primaryLightColor.withOpacity(0.5);

final appThemeLight = ThemeData(
  primaryColor: primaryLightColor,
  scaffoldBackgroundColor: backgroundLightColor,
  highlightColor: secondaryLightColor,
  fontFamily: 'Montserrat',

  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
    ),
    displayMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    displaySmall: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: hintText
    ),
    titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: hintText
    ),
    titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: hintText
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
        fontWeight: FontWeight.w900,
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