import '../../../util/colors/app_colors.dart';
import '../../../util/padding/padding_ext.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    required this.obscureText,
    required this.controller,
    this.textInputType,
    this.onEditingComplete,
    this.focusNode,
    this.maxLength,
  });

  final String labelText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.07, vertical: context.height * 0.01),
      child: TextField(
        focusNode: focusNode,
        maxLength: maxLength,
        onEditingComplete: onEditingComplete,
        keyboardType: textInputType,
        controller: controller,
        style: const TextStyle(color: AppColors.kPrimaryColor),
        obscureText: obscureText,
        cursorColor: AppColors.kSecondaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kSecondaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          label: Text(
            labelText,
            style: const TextStyle(color: AppColors.kSecondaryColor),
          ),
          prefixIconColor: Colors.white,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: AppColors.kTextFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
