import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    required this.onPressed,
    required this.child,
    this.elevation,
    this.backgroundColor = Colors.transparent,
    this.width = double.infinity,
    this.height = 60,
    this.colorSide,
    this.radius = 0,
    this.duration,
    this.overlayColor,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final double? elevation;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color? colorSide;
  final double radius;
  final Duration? duration;
  final Color? overlayColor;
  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).primaryColor;

    return OutlinedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        side: MaterialStateProperty.all(BorderSide(
          width: 1.5,
          color: colorSide ?? defaultColor,
        )),
        animationDuration: duration,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        overlayColor: MaterialStateProperty.all(overlayColor),
      ),
    );
  }
}
