import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_divider_item.dart';
import 'package:route_it/core/widgets/custom_loading_item.dart';
import 'package:route_it/core/widgets/custom_text_field_item.dart';
import 'package:route_it/core/widgets/custom_toast.dart';
import 'package:route_it/features/login/presentation/view_models/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/reset_password_cubit/reset_password_cubit.dart';

// ignore: must_be_immutable
class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showToast(state.message, ToastState.SUCCESS);
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is ResetPasswordFailure) {
          if (state.message.contains("complete")) {
            showToast(state.message, ToastState.ERROR);
            GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
          }
          showToast(state.message, ToastState.ERROR);
        }
      },
      builder: (context, state) {
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
                padding: EdgeInsets.all(size.width * 0.07),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          CustomTextFieldItem(
                              controller: emailController,
                              type: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // return 'Last name must not be empty !';
                                  return '';
                                }
                                return null;
                              },
                              hint: "Email",
                              prefix: Iconsax.personalcard),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          BlocBuilder<PasswordVisibilityCubit,
                                  PasswordVisibilityState>(
                              builder: (context, state) => CustomTextFieldItem(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        // return 'Password is too Short !';
                                        return '';
                                      }
                                      return null;
                                    },
                                    hint: "Password",
                                    prefix: Iconsax.lock,
                                    suffix: PasswordVisibilityCubit.get(context)
                                        .suffix,
                                    suffixPressed: () {
                                      PasswordVisibilityCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    isPassword:
                                        PasswordVisibilityCubit.get(context)
                                            .isPassword,
                                  )),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          BlocBuilder<PasswordVisibilityCubit,
                                  PasswordVisibilityState>(
                              builder: (context, state) => CustomTextFieldItem(
                                    controller: confirmationPasswordController,
                                    type: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        // return 'Password is too Short !';
                                        return '';
                                      }
                                      return null;
                                    },
                                    hint: "Password Confirmation",
                                    prefix: Iconsax.lock,
                                    suffix: PasswordVisibilityCubit.get(context)
                                        .suffix,
                                    suffixPressed: () {
                                      PasswordVisibilityCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    isPassword:
                                        PasswordVisibilityCubit.get(context)
                                            .isPassword,
                                  )),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          ConditionalBuilder(
                            condition: state is! ResetPasswordLoading,
                            builder: (context) {
                              return CustomButtonItem(
                                textColor: textOnPrimaryColor,
                                radius: 10,
                                backgroundColor: darkPrimaryColor,
                                width: double.infinity,
                                height: size.height * 0.05,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<ResetPasswordCubit>(context)
                                        .resetPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          confirmationPasswordController.text,
                                    );
                                  }
                                },
                                text: "Next",
                              );
                            },
                            fallback: (context) => const CustomLoadingItem(),
                          ),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          const CustomDividerItem(),
                          SizedBox(
                            height: size.height * .02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
