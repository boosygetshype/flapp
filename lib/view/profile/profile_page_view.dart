import 'package:flapp/util/colors/app_colors.dart';
import 'package:flapp/util/padding/padding_ext.dart';
import 'package:flapp/view_model/profile/profile_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel().viewModel,
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: AppColors.kScaffoldBGColor,
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05,
                          vertical: context.height * 0.05),
                      child: const CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: AssetImage(
                          "assets/user.jpeg",
                        ),
                      ),
                    ),
                    Text(
                      "İsim: ${viewModel.name}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Text(
                      "Email: ${viewModel.email}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
