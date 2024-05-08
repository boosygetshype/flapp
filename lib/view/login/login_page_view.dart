import 'package:flapp/view/login/widget/app_title.dart';
import '../../model/login/firebase_login_model.dart';
import '../../view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../util/routes/app_routes.dart';
import 'widget/button_tile.dart';
import 'widget/forgot_pass.dart';
import '../../util/colors/app_colors.dart';
import '../../util/padding/padding_ext.dart';
import 'widget/custom_text_field.dart';
import 'widget/divider_item.dart';
import 'widget/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, _) {
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
                    const AppTitle(),
                    const _SizedBoxItem(),
                    CustomTextField(
                      focusNode: loginViewModel.focusNode1,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(loginViewModel.focusNode2);
                      },
                      textInputType: TextInputType.emailAddress,
                      controller: loginViewModel.tEmailController,
                      obscureText: false,
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: "Email",
                    ),
                    CustomTextField(
                      focusNode: loginViewModel.focusNode2,
                      textInputType: TextInputType.visiblePassword,
                      controller: loginViewModel.tPasswordController,
                      obscureText: loginViewModel.textFieldSecure,
                      prefixIcon: IconButton(
                        onPressed: () => loginViewModel.obscureText(context),
                        icon: Icon(
                          loginViewModel.getPrefixIcon(),
                        ),
                      ),
                      labelText: "Password",
                    ),
                    const ForgotPassItem(),
                    RoundedButton(
                      onTap: () {
                        LoginModel loginModel = LoginModel(
                            email: loginViewModel.tEmailController.text,
                            password: loginViewModel.tPasswordController.text);
                        loginViewModel.signIn(context, loginModel);
                      },
                      buttonText: "Sign In",
                    ),
                   const _GoSignUpItem(),
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
        },
      ),
    );
  }
}

class _GoSignUpItem extends StatelessWidget {
  const _GoSignUpItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: context.height * 0.03),
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
    );
  }
}

class _SizedBoxItem extends StatelessWidget {
  const _SizedBoxItem();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.09,
    );
  }
}
