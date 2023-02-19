import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';

class CommomTextFormField extends StatefulWidget {
  final TextInputType? type;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final String? errorText;
  final TextInputAction? action;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;

  const CommomTextFormField({
    Key? key,
    this.type,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.errorText,
    this.action,
    this.onFieldSubmitted,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  State<CommomTextFormField> createState() => _CommomTextFormFieldState();
}

class _CommomTextFormFieldState extends State<CommomTextFormField> {
  static const _borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 2, color: AppColor.black),
  );
  static const _borderErrorStyle = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 2, color: AppColor.error),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.action ?? TextInputAction.next,
      keyboardType: widget.type,
      cursorColor: Colors.black,
      style: AppTextStyle.blackW400Large,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColor.white,
          hintText: widget.hintText,
          border: _borderStyle,
          disabledBorder: _borderStyle,
          errorBorder: _borderErrorStyle,
          enabledBorder: _borderStyle,
          focusedBorder: _borderStyle,
          focusedErrorBorder: _borderErrorStyle,
          hintStyle: AppTextStyle.blackOp5W400Large,
          errorText: widget.errorText),
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
