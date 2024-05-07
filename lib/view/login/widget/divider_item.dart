import '../../../util/colors/app_colors.dart';
import '../../../util/padding/padding_ext.dart';
import 'package:flutter/material.dart';

class DividerItems extends StatelessWidget {
  const DividerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.03),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.03,
              ),
              child:
                  const Divider(thickness: 2, color: AppColors.kPrimaryColor),
            ),
          ),
          Text(
            "Or contiune with",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.03,
              ),
              child:
                  const Divider(thickness: 2, color: AppColors.kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
