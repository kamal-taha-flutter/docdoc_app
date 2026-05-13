import 'package:docdoc_app/core/theme/colors.dart';
import 'package:docdoc_app/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObsecureText,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.contentPadding,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });
  final String hintText;
  final bool? isObsecureText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.primary, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManger.lightergrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: backgroundColor ?? ColorsManger.morelightgrey,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        return validator(value);
      },
      obscureText: isObsecureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueRegular,
    );
  }
}
