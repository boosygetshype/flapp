import 'package:firebase_core/firebase_core.dart';
import 'view_model/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'view/home/home_page_view.dart';
import 'view/login/register_page.view.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: MainConstants.debugShowCheckedModeBanner,
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, _) {
            return authViewModel.isAuthenticated
                ? HomePage()
                : const RegisterPage();
          },
        ),
        routes: AppRoutes.routes,
      ),
    );
  }
}
