import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:otp/modules/decryption/cubit/cubit.dart';
import 'package:otp/shared/alert_dialog/dialog.dart';
import 'package:otp/shared/components/my_outlined_button.dart';
import 'package:otp/shared/components/my_text_field.dart';
import 'package:otp/shared/theme/colors.dart';

class DecryptionScreen extends StatelessWidget {
  const DecryptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => DecryptionCubit(),
      child: BlocConsumer<DecryptionCubit, DecryptionStates>(
        listener: (context, state) {
          if (state is DecryptionSuccessState) {
            MyDialog.decryption(context: context, plainText: state.plainText);
          }
          if (state is DecryptionErrorState) {
            MyDialog.error(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          var cubit = DecryptionCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimationConfiguration.staggeredList(
                        position: 0,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 44.0,
                          child: FadeInAnimation(
                            child: MyTextFormField(
                              validator: (value) =>
                                  value != null && value.isEmpty
                                      ? 'Cipher text is required !'
                                      : null,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              label: 'Cipher Text',
                              controller: cubit.cipherText,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      AnimationConfiguration.staggeredList(
                        position: 1,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 44.0,
                          child: FadeInAnimation(
                            child: MyTextFormField(
                              validator: (value) =>
                                  value != null && value.isEmpty
                                      ? 'Key is required !'
                                      : null,
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              label: 'Key',
                              controller: cubit.key,
                              borderRadius: 10,
                              prefixIcon: Icons.vpn_key_rounded,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimationConfiguration.staggeredList(
                        position: 2,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 44.0,
                          child: FadeInAnimation(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: MyOutlinedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.decryption();
                                      }
                                    },
                                    child: Text(
                                      'Decryption',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    height: 53,
                                    elevation: 0,
                                    radius: 10,
                                    backgroundColor: primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: MyOutlinedButton(
                                    onPressed: () {
                                      cubit.clear();
                                    },
                                    child: const Text(
                                      'Clear',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    height: 53,
                                    elevation: 0,
                                    radius: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
