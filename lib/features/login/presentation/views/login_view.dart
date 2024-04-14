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

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login now",
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
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Address !';
                            }
                            return null;
                          },
                          hint: "EMAIL",
                          prefix: Iconsax.message),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      CustomTextFieldItem(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is too Short !';
                          }
                          return null;
                        },
                        hint: "PASSWORD",
                        prefix: Iconsax.lock,
                        suffix: Iconsax.eye_slash,
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      CustomButtonItem(
                        textColor: textOnPrimaryColor,
                        radius: 10,
                        backgroundColor: primaryColor,
                        width: double.infinity,
                        height: size.height * 0.05,
                        function: () {
                          GoRouter.of(context).push(AppRouter.kHomeView);
                        },
                        text: "sign in",
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
                            'Don\'t have an account ? ',
                            style: TextStyle(
                                color: lightPrimaryColor, fontSize: 15),
                          ),
                          SizedBox(width: size.width * .01),
                          CustomTextButtonItem(
                            function: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kRegisterView1);
                            },
                            text: 'register',
                            color: secondaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
