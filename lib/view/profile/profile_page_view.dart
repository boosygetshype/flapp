import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flapp/service/user/get_user_data_service.dart';
import 'package:flapp/util/colors/app_colors.dart';
import 'package:flapp/util/padding/padding_ext.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: GetUserData().getUserData(uid!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text("Hata:${snapshot.error}");
        }
        if (!snapshot.hasData) {
          return const Text("Gösterilecek veri yok");
        }
        String name = snapshot.data!["name"];
        String email = snapshot.data!["email"];

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
                    "İsim: $name",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    "Email: $email",
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
    );
  }
}
