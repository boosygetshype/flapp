import 'package:flapp/service/auth/auth_service.dart';
import 'package:flapp/view/home/home_page_view.dart';

import 'package:flutter/material.dart';

import '../../view/login/login_page_view.dart';
import '../../view/login/register_page.view.dart';

class AppRoutes {
  final AuthService authService = AuthService();

  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
 

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    home: (context) => const HomePage(),
    
         
  };
}
