import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/shared/constants.dart';

part 'states.dart';

class EncryptionCubit extends Cubit<EncryptionStates> {
  EncryptionCubit() : super(LayoutInitial());

  static EncryptionCubit get(context) => BlocProvider.of(context);

  var plainText = TextEditingController();

  String _cipherText = '';

  void encryption() {
    try {
      var _plain = plainText.text;
      var _key = keyGeneration(_plain.length);

      _cipherText = List.generate(
        _plain.length,
        (index) {
          // ^ == XOR
          int i = chars.indexOf(_key[index]) ^ chars.indexOf(_plain[index]);
          return chars[i % chars.length];
        },
      ).join();

      emit(EncryptionSuccessState(
        cipherText: _cipherText,
        key: _key,
      ));
    } catch (error) {
      emit(EncryptionErrorState('$error'));
    }
  }

  String keyGeneration(int len) {
    var rand = Random();
    return List.generate(len, (index) {
      int i = rand.nextInt(chars.length);
      return chars[i];
    }).join();
  }

  void clear() {
    plainText.clear();
    emit(ClearFieldState());
  }
}
