import '../../util/colors/app_colors.dart';
import '../../util/padding/padding_ext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => Navigator.pop(context)),
      backgroundColor: AppColors.kScaffoldBGColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: context.height * 0.1,
              //   width: context.width * 0.2,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(60),
              //     image: const DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage("assets/user.jpeg"),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
