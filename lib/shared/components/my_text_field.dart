import 'package:flutter/material.dart';
import 'package:otp/shared/constants.dart';
import 'package:otp/shared/extensions.dart';
import 'package:otp/shared/theme/colors.dart';

class MyTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? label;
  final String? hint;
  final void Function(String)? onSubmit;
  final bool isPassword;
  final double borderRadius;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final int maxLines;
  final bool readOnly;
  const MyTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    required String? this.validator(String? value)?,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.hint,
    this.onSubmit(value)?,
    this.isPassword = false,
    this.borderRadius = 4.0,
    this.maxLength,
    this.labelStyle,
    this.hintStyle,
    this.maxLines = 1,
    this.readOnly = false,
  })  : assert(!isPassword || suffixIcon == null,
            '\n\nError: Cannot provide both an isPassword and a suffixIcon\n'),
        super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      style: const TextStyle(
        color: primaryColor,
      ),
      controller: widget.controller,
      decoration: InputDecoration(
        counter: const Offstage(),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        alignLabelWithHint: true,
        labelStyle: widget.labelStyle,
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: primaryColor,
              )
            : null,
        suffixIcon: !widget.isPassword
            ? widget.suffixIcon == null
                ? null
                : Icon(
                    widget.suffixIcon,
                    color: primaryColor,
                  )
            : IconButton(
                color: primaryColor,
                onPressed: () => setState(() {
                  obscureText = !obscureText;
                }),
                icon: obscureText
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: theme.isDark ? Colors.grey.shade800 : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmit,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
    );
  }
}
