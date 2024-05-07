import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flapp/util/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("Users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> _registerUser(
      {required String name,
      required String email,
      required String password}) async {
    await userCollection
        .doc()
        .set({"name": name, "email": email, "password ": password});
  }

  Future<void> signUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _registerUser(name: name, email: email, password: password);

        navigator.popAndPushNamed(AppRoutes.login);
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Durations.extralong4,
        ),
      );
    }
  }

  Future<void> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text("Giriş Başarılı"),
            duration: Durations.extralong4,
          ),
        );
        navigator.popAndPushNamed(AppRoutes.home);
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Durations.extralong4,
        ),
      );
    }
  }

  Future<void> signOut() async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
  }
}
