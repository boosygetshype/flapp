import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../util/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("Users");
  final firebaseAuth = FirebaseAuth.instance;

  // Future<void> _registerUser(
  //     {required String name,
  //     required String email,
  //     required String password}) async {
  //   await userCollection
  //       .doc()
  //       .set({"name": name, "email": email, "password ": password});
  // }

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
      await userCredential.user!.sendEmailVerification();
      AuthService().signOut(context);
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text(
              'Doğrulama e-postası gönderildi. Lütfen e-postanızı kontrol edin.'),
          duration: Durations.extralong4,
        ),
      );

      if (userCredential.user != null) {
        userCollection
            .doc(userCredential.user!.uid)
            .set({"name": name, "email": email, "password": password, "profilePhotoUrl" : ""});

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
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content:
                Text("Giriş başarısız. Lütfen bilgilerinizi kontrol edin."),
            duration: Durations.extralong4,
          ),
        );
        return;
      }

      if (!userCredential.user!.emailVerified) {
        userCredential.user!.sendEmailVerification();
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(
                'E-postanızı doğrulamadınız. Lütfen e-postanızı kontrol edin ve doğrulama işlemini tamamlayın.'),
            duration: Durations.extralong4,
          ),
        );
        await firebaseAuth.signOut();
        return;
      }

      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Giriş Başarılı"),
          duration: Durations.extralong4,
        ),
      );
      navigator.popAndPushNamed(AppRoutes.home);
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Durations.extralong4,
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    Navigator.popAndPushNamed(context, AppRoutes.login);
  }
}
