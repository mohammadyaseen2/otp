part of 'cubit.dart';

@immutable
abstract class EncryptionStates {}

class LayoutInitial extends EncryptionStates {}

class KeyGenerationState extends EncryptionStates {}

class EncryptionSuccessState extends EncryptionStates {
  final String cipherText;
  final String key;
  EncryptionSuccessState({required this.cipherText, required this.key});
}

class EncryptionErrorState extends EncryptionStates {
  final String error;
  EncryptionErrorState(this.error);
}

class ClearFieldState extends EncryptionStates {}
