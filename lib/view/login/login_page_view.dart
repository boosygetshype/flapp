import '../../service/auth/auth_service.dart';
import '../../util/routes/app_routes.dart';

import 'widget/button_tile.dart';
import 'widget/forgot_pass.dart';

import '../../util/colors/app_colors.dart';
import '../../util/padding/padding_ext.dart';
import 'widget/custom_text_field.dart';
import 'widget/divider_item.dart';
import 'widget/rounded_button.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  handlePop() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final TextEditingController _tEmailController = TextEditingController();
  final TextEditingController _tPasswordController = TextEditingController();
  bool _textFieldSecure = false;
  obscureText() {
    if (_tPasswordController.text.isEmpty == true) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.kScaffoldBGColor,
          duration: Durations.long4,
          content: Text(
            "Please fill input please!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      );
    } else {
      setState(() {
        _textFieldSecure = !_textFieldSecure;
      });
    }
  }

  getPrefixIcon() {
    return _textFieldSecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldBGColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.09,
              ),
              Text(
                "Flapp",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
              SizedBox(
                height: context.height * 0.09,
              ),
              CustomTextField(
                focusNode: _focusNode1,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_focusNode2);
                },
                textInputType: TextInputType.emailAddress,
                controller: _tEmailController,
                obscureText: false,
                prefixIcon: const Icon(Icons.person_outline),
                labelText: "Email",
              ),
              CustomTextField(
                focusNode: _focusNode2,
                textInputType: TextInputType.visiblePassword,
                controller: _tPasswordController,
                obscureText: _textFieldSecure,
                prefixIcon: IconButton(
                    onPressed: () => obscureText(),
                    icon: Icon(getPrefixIcon())),
                labelText: "Password",
              ),
              const ForgotPassItem(),
              RoundedButton(
                onTap: () => AuthService().signIn(
                    context: context,
                    email: _tEmailController.text,
                    password: _tPasswordController.text),
                buttonText: "Sign In",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "You don't have a acc?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(
                          context, AppRoutes.register),
                      child: Text(
                        " Lets sign up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.kSecondaryColor),
                      ),
                    )
                  ],
                ),
              ),
              const DividerItems(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTile(
                    imagePath: "assets/google.png",
                    onTap: () {},
                  ),
                  ButtonTile(imagePath: "assets/facebook.png")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
