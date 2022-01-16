import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:otp/modules/encryption/cubit/cubit.dart';
import 'package:otp/shared/alert_dialog/dialog.dart';
import 'package:otp/shared/components/my_outlined_button.dart';
import 'package:otp/shared/components/my_text_field.dart';
import 'package:otp/shared/theme/colors.dart';

class EncryptionScreen extends StatelessWidget {
  const EncryptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (_) => EncryptionCubit(),
      child: BlocConsumer<EncryptionCubit, EncryptionStates>(
        listener: (context, state) {
          if (state is EncryptionSuccessState) {
            MyDialog.encryption(
              context: context,
              key: state.key,
              cipherText: state.cipherText,
            );
          }
          if (state is EncryptionErrorState) {
            MyDialog.error(context: context, error: state.error);
          }
        },
        builder: (context, _) {
          var cubit = EncryptionCubit.get(context);
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
                                      ? 'Plaint text is required !'
                                      : null,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              label: 'Plaint Text',
                              controller: cubit.plainText,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimationConfiguration.staggeredList(
                        position: 1,
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
                                        cubit.encryption();
                                      }
                                    },
                                    child: Text(
                                      'Encryption',
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
