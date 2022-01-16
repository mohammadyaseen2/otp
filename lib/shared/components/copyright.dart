import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Copyright © 2022 All rights reserved',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
      ),
    );
  }
}
