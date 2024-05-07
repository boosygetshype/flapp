import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flapp/view/home/home_page_view.dart';

import 'package:flapp/view/login/register_page.view.dart';

import 'firebase_options.dart';
import 'util/constants/main_const.dart';
import 'util/routes/app_routes.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: MainConstants.debugShowCheckedModeBanner,
      home: user != null ? const HomePage() : const RegisterPage(),
      routes: AppRoutes.routes,
    );
  }
}
