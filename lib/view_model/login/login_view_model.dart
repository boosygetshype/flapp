import '../../model/login/firebase_login_model.dart';
import '../../util/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../../service/auth/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
    final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
  }
  final TextEditingController tEmailController = TextEditingController();
  final TextEditingController tPasswordController = TextEditingController();
  bool textFieldSecure = false;
  final AuthService _authService = AuthService();

  Future<void> signIn(BuildContext context, LoginModel loginModel) async {
    await _authService.signIn(
        context: context,
        email: loginModel.email,
        password: loginModel.password);
  }

  obscureText(BuildContext context) {
    if (tPasswordController.text.isEmpty == true) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.kScaffoldBGColor,
          duration: Durations.long4,
          content: Text(
            "Fill input please!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      );
    } else {
      textFieldSecure = !textFieldSecure;
      notifyListeners();
    }
  }

  getPrefixIcon() {
    return textFieldSecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }
}
