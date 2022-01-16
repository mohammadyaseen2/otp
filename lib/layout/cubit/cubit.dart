import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/modules/about/about_screen.dart';
import 'package:otp/modules/decryption/decryption_screen.dart';
import 'package:otp/modules/encryption/encryption_screen.dart';
import 'package:otp/modules/side_bar/side_bar_items.dart';
import 'package:otp/shared/constants.dart';
import 'package:otp/shared/theme/themes.dart';

part 'states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  bool switchValue = false;
  String currentItem = SideBarItems.encryption;

  Map<String, Widget> mainScreens = const {
    SideBarItems.encryption: EncryptionScreen(),
    SideBarItems.decryption: DecryptionScreen(),
    SideBarItems.about: AboutScreen(),
  };

  void changeSideItem(item) {
    currentItem = item;
    emit(ChangeSideBarItemState());
  }

  void changeTheme(value) {
    theme = value ? darkTheme : lightTheme;
    switchValue = value;
    emit(ChangeThemeState());
  }
}
