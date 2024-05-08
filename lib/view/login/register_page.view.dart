import '../../model/register/firebase_register_mode.dart';
import '../../view_model/register/register_view_model.dart';
import 'package:provider/provider.dart';


import '../../util/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'widget/button_tile.dart';

import '../../util/colors/app_colors.dart';
import '../../util/padding/padding_ext.dart';
import 'widget/custom_text_field.dart';
import 'widget/divider_item.dart';
import 'widget/rounded_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, registerViewModel, _) {
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
                      focusNode: registerViewModel.focusNode1,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(registerViewModel.focusNode2);
                      },
                      textInputType: TextInputType.name,
                      controller: registerViewModel.tNameController,
                      obscureText: false,
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: "Name",
                    ),
                    CustomTextField(
                      focusNode: registerViewModel.focusNode2,
                      textInputType: TextInputType.emailAddress,
                      controller: registerViewModel.tEmailController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(registerViewModel.focusNode3);
                      },
                      obscureText: false,
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: "Email",
                    ),
                    CustomTextField(
                      focusNode: registerViewModel.focusNode3,
                      textInputType: TextInputType.visiblePassword,
                      controller: registerViewModel.tPasswordController,
                      obscureText: registerViewModel.textFieldSecure,
                      prefixIcon: IconButton(
                        onPressed: () => registerViewModel.obscureText(context),
                        icon: Icon(
                        registerViewModel.getPrefixIcon()
                        ),
                      ),
                      labelText: "Password",
                    ),
                    RoundedButton(
                      onTap: () {
                        RegisterModel registerModel = RegisterModel(
                          name: registerViewModel.tNameController.text,
                          email: registerViewModel.tEmailController.text,
                          password: registerViewModel.tPasswordController.text,
                        );
                        registerViewModel.signUp(context, registerModel);
                      },
                      buttonText: "Sign Up",
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.03),
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
                              onTap: () => Navigator.popAndPushNamed(
                                  context, AppRoutes.login),
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
        },
      ),
    );
  }
}
