import 'package:flutter/material.dart';

@immutable
abstract class SideBarItems {
  static const String encryption = 'Encryption';
  static const String decryption = 'Decryption';
  static const String about = 'About';

  static const all = <String>[
    encryption,
    decryption,
    about,
  ];
}
