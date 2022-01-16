import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:otp/shared/components/my_text_field.dart';
import 'package:otp/shared/theme/colors.dart';

part 'decryption_dialog.dart';
part 'encryption_dialog.dart';
part 'error_dialog.dart';

abstract class MyDialog
    with _EncryptionDialog, _DecryptionDialog, _ErrorDialog {
  static encryption({
    required context,
    required key,
    required cipherText,
  }) =>
      _EncryptionDialog.get(
        context: context,
        key: key,
        cipherText: cipherText,
      );

  static decryption({
    required context,
    required plainText,
  }) =>
      _DecryptionDialog.get(
        context: context,
        plainText: plainText,
      );

  static error({
    required context,
    required error,
  }) =>
      _ErrorDialog.get(
        context: context,
        error: error,
      );
}

void _copy({required String text, required String msg}) {
  Clipboard.setData(ClipboardData(text: text));
  SmartDialog.showToast(
    msg,
    isLoadingTemp: false,
    type: SmartToastType.last,
    alignment: Alignment.center,
    time: const Duration(milliseconds: 750),
    widget: Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(msg, style: const TextStyle(color: Colors.white)),
    ),
  );
}
