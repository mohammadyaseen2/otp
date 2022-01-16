import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:otp/shared/theme/colors.dart';

class ThemeSwitch extends StatelessWidget {
  final bool switchValue;
  final ValueChanged<bool> onToggle;

  const ThemeSwitch({
    Key? key,
    required this.switchValue,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.light_mode_outlined,
          size: 20,
          color: switchValue ? Colors.white38 : Colors.white70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: FlutterSwitch(
            height: 20,
            width: 45,
            padding: 2.5,
            toggleSize: 15,
            activeToggleColor: darkColor,
            inactiveToggleColor: Colors.white,
            // toggleColor: ,
            value: switchValue,
            onToggle: onToggle,
            activeColor: const Color(0xff006B5A),
            inactiveColor: const Color(0xff006B5A),
          ),
        ),
        Icon(
          Icons.dark_mode_outlined,
          size: 20,
          color: switchValue ? Colors.black87 : Colors.black54,
        ),
      ],
    );
  }
}
