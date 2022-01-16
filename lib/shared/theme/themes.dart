import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: lightColor,
  primarySwatch: primaryColor,
  primaryColor: primaryColor,
  primaryIconTheme: const IconThemeData(color: lightColor),
  iconTheme: const IconThemeData(color: lightColor),
  scaffoldBackgroundColor: lightColor,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: lightColor),
    backgroundColor: primaryColor,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: lightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    iconTheme: IconThemeData(color: lightColor),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: darkColor),
    bodyText2: TextStyle(color: lightColor),
    headline1: TextStyle(color: lightColor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lightColor,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  listTileTheme: ListTileThemeData(
    textColor: lightColor.withOpacity(0.6),
    selectedColor: lightColor,
    iconColor: lightColor.withOpacity(0.8),
  ),
);

ThemeData darkTheme = ThemeData(
  backgroundColor: darkColor,
  primaryColor: primaryColor,
  primarySwatch: primaryColor,
  primaryIconTheme: const IconThemeData(color: darkColor),
  iconTheme: const IconThemeData(color: darkColor),
  scaffoldBackgroundColor: darkColor,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: darkColor),
    backgroundColor: primaryColor,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: darkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    iconTheme: IconThemeData(color: darkColor),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: lightColor.withOpacity(0.7)),
    bodyText2: const TextStyle(color: darkColor),
    headline1: const TextStyle(color: darkColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    backgroundColor: const Color(0xff2d3239),
    elevation: 20,
    unselectedItemColor: Colors.grey[600],
  ),
  listTileTheme: ListTileThemeData(
    textColor: darkColor.withOpacity(0.8),
    selectedColor: Colors.black,
    iconColor: darkColor.withOpacity(0.8),
  ),
);
