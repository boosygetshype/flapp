import '../../model/register/firebase_register_mode.dart';
import '../../util/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../../service/auth/auth_service.dart';

class RegisterViewModel extends ChangeNotifier {


 final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();  
  
   @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

 



  final TextEditingController tEmailController = TextEditingController();
  final TextEditingController tPasswordController = TextEditingController();
  final TextEditingController tNameController = TextEditingController();
  bool textFieldSecure = false;
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

  IconData getPrefixIcon() {
    return textFieldSecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  final AuthService _authService = AuthService();

  Future<void> signUp(BuildContext context, RegisterModel registerModel) async {
    await _authService.signUp(
      context: context,
      name: registerModel.name,
      email: registerModel.email,
      password: registerModel.password,
    );
  }
}
