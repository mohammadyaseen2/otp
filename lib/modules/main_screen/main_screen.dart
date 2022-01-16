import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/layout/cubit/cubit.dart';
import 'package:otp/shared/components/window_buttons.dart';
import 'package:otp/shared/constants.dart';
import 'package:otp/shared/theme/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return Expanded(
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(child: MoveWindow()),
                    WindowButtons(theme: buttonsColors[theme]!)
                  ],
                ),
              ),
              Expanded(
                child: cubit.mainScreens[cubit.currentItem]!,
              ),
            ],
          ),
        );
      },
    );
  }
}
