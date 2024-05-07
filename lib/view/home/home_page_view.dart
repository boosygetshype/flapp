import 'package:flapp/service/auth/auth_service.dart';
import 'package:flapp/util/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut();
              Navigator.popAndPushNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
