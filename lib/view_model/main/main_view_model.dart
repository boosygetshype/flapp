import 'package:firebase_auth/firebase_auth.dart';
import '../../model/user/firebase_user_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  User? _user;

  AuthViewModel() {
    _user = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  UserModel get userModel => UserModel(user: _user);

  bool get isAuthenticated => _user != null;
}
