import 'package:flapp/service/auth/auth_service.dart';
import 'package:flapp/util/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'widget/button_tile.dart';

import '../../util/colors/app_colors.dart';
import '../../util/padding/padding_ext.dart';
import 'widget/custom_text_field.dart';
import 'widget/divider_item.dart';
import 'widget/rounded_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  final FocusNode _focusNode3 = FocusNode();
  final TextEditingController _tEmailController = TextEditingController();
  final TextEditingController _tPasswordController = TextEditingController();
  final TextEditingController _tNameController = TextEditingController();
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
                textInputType: TextInputType.name,
                controller: _tNameController,
                obscureText: false,
                prefixIcon: const Icon(Icons.person_outline),
                labelText: "Name",
              ),
              CustomTextField(
                focusNode: _focusNode2,
                textInputType: TextInputType.emailAddress,
                controller: _tEmailController,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_focusNode3);
                },
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: "Email",
              ),
              CustomTextField(
                focusNode: _focusNode3,
                textInputType: TextInputType.visiblePassword,
                controller: _tPasswordController,
                obscureText: _textFieldSecure,
                prefixIcon: IconButton(
                  onPressed: () => obscureText(),
                  icon: Icon(
                    getPrefixIcon(),
                  ),
                ),
                labelText: "Password",
              ),
              RoundedButton(
                onTap: () => AuthService().signUp(
                  context: context,
                  name: _tNameController.text,
                  email: _tEmailController.text,
                  password: _tPasswordController.text,
                ),
                buttonText: "Sign Up",
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You already have an acc?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, AppRoutes.login),
                        child: Text(
                          " Lets sign in",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kSecondaryColor),
                        ),
                      )
                    ],
                  )),
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
