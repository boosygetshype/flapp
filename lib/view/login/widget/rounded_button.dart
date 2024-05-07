import 'package:flutter/material.dart';

import '../../../util/colors/app_colors.dart';
import '../../../util/padding/padding_ext.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  RoundedButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });
  final String buttonText;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.kPrimaryColor, AppColors.kSecondaryColor],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        width: context.width,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.018,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.07, vertical: context.height * 0.01),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
