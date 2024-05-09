import 'package:firebase_auth/firebase_auth.dart';
import '../../util/padding/padding_ext.dart';
import 'widget/drawer_item.dart';
import '../../util/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: AppColors.kScaffoldBGColor,
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.01,
                  horizontal: context.width * 0.01),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu_outlined,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: context.width * 0.1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*  
 IconButton(
            onPressed: () {
              AuthService().signOut();
              Navigator.popAndPushNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.logout_outlined),
          )
*/

