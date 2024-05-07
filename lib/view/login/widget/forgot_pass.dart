import '../../../util/colors/app_colors.dart';
import '../../../util/padding/padding_ext.dart';
import 'package:flutter/material.dart';
class ForgotPassItem extends StatelessWidget {
  const ForgotPassItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.width * 0.644),
        const Text(
          "Forgot Password?",
          style: TextStyle(color: AppColors.kSecondaryColor),
        ),
      ],
    );
  }
}
