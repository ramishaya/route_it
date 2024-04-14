// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_text_field_item.dart';
import 'package:route_it/core/widgets/custom_divider_item.dart';
import 'package:route_it/core/widgets/custom_text_button_item.dart';

class RegisterView1 extends StatelessWidget {
  RegisterView1({super.key});

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            darkPrimaryColor,
            primaryColor,
            secondaryColor2,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Create new account",
                      style: TextStyle(
                          color: lightPrimaryColor,
                          fontSize: 45,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    CustomTextFieldItem(
                        controller: firstNameController,
                        type: TextInputType.text,
                        validator: (value) {},
                        hint: "FIRST NAME",
                        prefix: Iconsax.user),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomTextFieldItem(
                        controller: lastNameController,
                        type: TextInputType.text,
                        validator: (value) {},
                        hint: "LAST NAME",
                        prefix: Iconsax.user_add),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomTextFieldItem(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {},
                        hint: "EMAIL",
                        prefix: Iconsax.message),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomTextFieldItem(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validator: (value) {},
                        hint: "PASSWORD",
                        prefix: Iconsax.lock,
                        suffix: Iconsax.eye_slash),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    CustomButtonItem(
                      function: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView2);
                      },
                      text: "next",
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    const CustomDividerItem(),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I already have an account',
                          style:
                              TextStyle(color: lightPrimaryColor, fontSize: 15),
                        ),
                        SizedBox(width: size.width * .01),
                        CustomTextButtonItem(
                            function: () {
                              GoRouter.of(context).push(AppRouter.kLoginView);
                            },
                            text: 'login',
                            color: secondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
