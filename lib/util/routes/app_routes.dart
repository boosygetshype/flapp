import 'package:flapp/view/profile/profile_page_view.dart';

import '../../service/auth/auth_service.dart';
import '../../view/home/home_page_view.dart';

import 'package:flutter/material.dart';

import '../../view/login/login_page_view.dart';
import '../../view/login/register_page.view.dart';

class AppRoutes {
  final AuthService authService = AuthService();

  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    home: (context) => HomePage(),
     profile: (context) => const ProfilePage(),
  };
}
