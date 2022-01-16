import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp/layout/cubit/cubit.dart';
import 'package:otp/modules/side_bar/side_bar_item.dart';
import 'package:otp/modules/side_bar/side_bar_items.dart';
import 'package:otp/modules/side_bar/theme_switch.dart';
import 'package:otp/shared/components/copyright.dart';
import 'package:otp/shared/theme/colors.dart';

import 'logo.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SizedBox(
          width: 200,
          child: Container(
            color: primaryColor,
            child: Column(
              children: [
                WindowTitleBarBox(child: MoveWindow()),
                Expanded(
                  child: Column(
                    children: [
                      const Logo(),
                      const Divider(),
                      ...SideBarItems.all
                          .map((item) => SideBarItem(
                                item: item,
                                currentItem: cubit.currentItem,
                                onSelectedItem: cubit.changeSideItem,
                              ))
                          .toList(),
                      const Spacer(),
                      ThemeSwitch(
                          switchValue: cubit.switchValue,
                          onToggle: cubit.changeTheme),
                      const SizedBox(height: 15),
                      const Copyright(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
