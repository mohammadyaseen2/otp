import 'package:flutter/material.dart';
import 'package:otp/shared/theme/themes.dart';

extension IsDark on ThemeData {
  bool get isDark => this == darkTheme;
}
