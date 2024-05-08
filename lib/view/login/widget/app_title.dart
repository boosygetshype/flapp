import 'package:flapp/util/colors/app_colors.dart';
import 'package:flutter/material.dart';


class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Flapp",
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColors.kPrimaryColor),
    );
  }
}
