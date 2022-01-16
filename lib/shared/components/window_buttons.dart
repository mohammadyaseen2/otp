import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:otp/shared/theme/colors.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key, required this.theme}) : super(key: key);
  final WindowButtonColors theme;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: theme),
        MaximizeWindowButton(colors: theme),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
