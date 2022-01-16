import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:otp/shared/theme/themes.dart';

const lightColor = Colors.white;
const darkColor = Color(0xff282c34);
const primaryColor = Colors.teal;

final darkButtonColors = WindowButtonColors(
  iconNormal: Colors.grey,
  mouseOver: Colors.white10,
  mouseDown: Colors.white12,
  iconMouseOver: Colors.grey,
  iconMouseDown: Colors.grey,
);

final lightButtonColors = WindowButtonColors(
  iconNormal: Colors.grey,
  mouseOver: const Color(0xFFE5E5E5),
  mouseDown: const Color(0xFFCACACB),
  iconMouseOver: Colors.grey,
  iconMouseDown: Colors.grey,
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: Colors.grey,
  iconMouseOver: Colors.white,
);

Map<ThemeData, WindowButtonColors> buttonsColors = {
  lightTheme: lightButtonColors,
  darkTheme: darkButtonColors,
};

Map<ThemeData, Color> borderColor = {
  lightTheme: primaryColor.shade100,
  darkTheme: primaryColor.shade900,
};
