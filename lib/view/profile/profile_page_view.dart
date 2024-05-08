// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flapp/util/colors/app_colors.dart';
import 'package:flapp/util/padding/padding_ext.dart';
import 'package:flapp/view_model/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: AppColors.kScaffoldBGColor,
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, _) {
          return profileViewModel.userProfile == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
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
                            backgroundImage: AssetImage("assets/user.jpeg"),
                          ),
                        ),
                        Text(
                          "İsim: ${profileViewModel.userProfile?.name}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: context.height * 0.01),
                        Text(
                          "Email: ${profileViewModel.userProfile?.email}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
