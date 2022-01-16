import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/layout/cubit/cubit.dart';
import 'package:otp/modules/main_screen/main_screen.dart';
import 'package:otp/modules/side_bar/side_bar_screen.dart';
import 'package:otp/shared/constants.dart';
import 'package:otp/shared/theme/colors.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: WindowBorder(
            color: borderColor[theme]!,
            width: 1,
            child: Row(
              children: const [
                SideBarScreen(),
                MainScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
