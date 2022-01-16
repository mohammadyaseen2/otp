import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:otp/layout/cubit/cubit.dart';
import 'package:otp/layout/layout.dart';
import 'package:otp/shared/bloc_observer.dart';
import 'package:otp/shared/constants.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
      doWhenWindowReady(() {
        final win = appWindow;
        const initialSize = Size(600, 450);
        win.minSize = initialSize;
        win.size = initialSize;
        win.alignment = Alignment.center;
        win.title = "OTP Encryption";
        win.show();
      });
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              title: 'OTP Encryption',
              theme: theme,
              debugShowCheckedModeBanner: false,
              home: const LayoutApp(),
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init());
        },
      ),
    );
  }
}
