import '../../../service/auth/auth_service.dart';
import '../../../util/colors/app_colors.dart';
import '../../../util/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kScaffoldBGColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            
            decoration: const BoxDecoration(),
            child: Center(
              child: Text(
                "Flapp",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.kSecondaryColor),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.person_outlined,
                color: AppColors.kSecondaryColor,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Navigator.popAndPushNamed(context, AppRoutes.profile)),
          ListTile(
            leading: const Icon(Icons.logout_outlined,
                color: AppColors.kSecondaryColor),
            title: const Text(
              "Log out",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => AuthService().signOut(context),
          ),
        ],
      ),
    );
  }
}
