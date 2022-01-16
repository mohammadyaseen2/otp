import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/shared/constants.dart';

part 'states.dart';

class DecryptionCubit extends Cubit<DecryptionStates> {
  DecryptionCubit() : super(LayoutInitial());

  static DecryptionCubit get(context) => BlocProvider.of(context);

  var cipherText = TextEditingController();
  var key = TextEditingController();
  var _plainText = '';

  void decryption() {
    {
      try {
        var _cipher = cipherText.text;
        var _key = key.text;
        _plainText = List.generate(
          _cipher.length,
          (index) {
            // ^ == XOR
            int i = chars.indexOf(_key[index]) ^ chars.indexOf(_cipher[index]);
            return chars[i % chars.length];
          },
        ).join();

        emit(DecryptionSuccessState(_plainText));
      } catch (error) {
        emit(DecryptionErrorState('$error'));
      }
    }
  }

  void clear() {
    cipherText.clear();
    key.clear();
    emit(ClearFieldState());
  }
}
