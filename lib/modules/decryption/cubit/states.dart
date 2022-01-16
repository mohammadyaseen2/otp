part of 'cubit.dart';

@immutable
abstract class DecryptionStates {}

class LayoutInitial extends DecryptionStates {}

class DecryptionSuccessState extends DecryptionStates {
  final String plainText;
  DecryptionSuccessState(this.plainText);
}

class DecryptionErrorState extends DecryptionStates {
  final String error;
  DecryptionErrorState(this.error);
}

class ClearFieldState extends DecryptionStates {}
