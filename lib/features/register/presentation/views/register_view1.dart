// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/service_locator.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_error_item.dart';
import 'package:route_it/core/widgets/custom_loading_item.dart';
import 'package:route_it/core/widgets/custom_text_field_item.dart';
import 'package:route_it/core/widgets/custom_divider_item.dart';
import 'package:route_it/core/widgets/custom_text_button_item.dart';
import 'package:route_it/features/register/presentation/view_models/register_cubit/register_cubit.dart';

class RegisterView1 extends StatelessWidget {
  RegisterView1({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucces) {
          try {
            print("bhbhfjd");
            SharedPref.saveData(
                key: "Token", value: state.response.userWithToken!.token);
            print("We have the token let's goooo" +
                SharedPref.getData(key: "Token"));
          } catch (e) {
            print(e.toString());
          }

          GoRouter.of(context).push(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is RegisterInitial,
          fallback: (context) {
            if (state is RegisterFailure) {
              return CustomErrorItem(
                errorMessage: state.errMessage,
                size: size,
              );
            } else {
              return const CustomLoadingItem();
            }
          },
          builder: (context) {
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
                                controller: nameController,
                                type: TextInputType.text,
                                validator: (value) {},
                                hint: "FIRST NAME",
                                prefix: Iconsax.user),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            CustomTextFieldItem(
                                controller: emailController,
                                type: TextInputType.text,
                                validator: (value) {},
                                hint: "LAST NAME",
                                prefix: Iconsax.user_add),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            CustomTextFieldItem(
                                controller: passwordController,
                                type: TextInputType.emailAddress,
                                validator: (value) {},
                                hint: "EMAIL",
                                prefix: Iconsax.message),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            CustomTextFieldItem(
                                controller: confirmationPasswordController,
                                type: TextInputType.visiblePassword,
                                validator: (value) {},
                                hint: "PASSWORD",
                                prefix: Iconsax.lock,
                                suffix: Iconsax.eye_slash),
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
                                BlocProvider.of<RegisterCubit>(context)
                                    .register(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        passpasswordConfirmation:
                                            confirmationPasswordController
                                                .text);
                              },
                              text: "Next",
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
                                  style: TextStyle(
                                      color: lightPrimaryColor, fontSize: 15),
                                ),
                                SizedBox(width: size.width * .01),
                                CustomTextButtonItem(
                                  function: () {
                                    GoRouter.of(context)
                                        .push(AppRouter.kLoginView);
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
          },
        );
      },
    );
  }
}
