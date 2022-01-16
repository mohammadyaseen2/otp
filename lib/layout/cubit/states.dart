part of 'cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class ChangeSideBarItemState extends LayoutState {}

class KeyGenerationState extends LayoutState {}

class EncryptionState extends LayoutState {}

class DecryptionState extends LayoutState {}

class ClearFieldState extends LayoutState {}

class ChangeThemeState extends LayoutState {}
