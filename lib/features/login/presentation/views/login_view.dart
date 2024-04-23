// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_date_picker.dart';
import 'package:route_it/core/widgets/custom_loading_item.dart';
import 'package:route_it/core/widgets/custom_radio_list.dart';
import 'package:route_it/core/widgets/custom_text_field_item.dart';
import 'package:route_it/core/widgets/custom_divider_item.dart';
import 'package:route_it/core/widgets/custom_text_button_item.dart';
import 'package:route_it/core/widgets/custom_toast.dart';
import 'package:route_it/features/login/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:route_it/features/login/presentation/view_models/password_visibility_cubit/password_visibility_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showToast(state.info.message ?? "", ToastState.SUCCESS);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          CacheServices.saveData(key: "token", value: state.info.success!.token);
        }
        else if(state is LoginFailure){
          showToast(state.errMessage, ToastState.ERROR);
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
                                  // return 'Please Enter Your Email Address !';
                                  return '';
                                }
                                return null;
                              },
                              hint: "EMAIL",
                              prefix: Iconsax.message),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          BlocBuilder<PasswordVisibilityCubit , PasswordVisibilityState>(
                              builder: (context , state) => CustomTextFieldItem(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    // return 'Password is too Short !';
                                    return '';
                                  }
                                  return null;
                                },
                                hint: "PASSWORD",
                                prefix: Iconsax.lock,
                                suffix: PasswordVisibilityCubit.get(context).suffix,
                                suffixPressed: (){
                                  PasswordVisibilityCubit.get(context).changePasswordVisibility();
                                },
                                isPassword: PasswordVisibilityCubit.get(context).isPassword,
                              ),
                          ),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          ConditionalBuilder(
                              condition: state is! LoginLoading,
                              builder: (context){
                                return CustomButtonItem(
                                  textColor: textOnPrimaryColor,
                                  radius: 10,
                                  backgroundColor: darkPrimaryColor,
                                  width: double.infinity,
                                  height: size.height * 0.05,
                                  function: () {
                                    if(formKey.currentState!.validate()){
                                      BlocProvider.of<LoginCubit>(context).login(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  text: "sign in",
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
                                  GoRouter.of(context).push(AppRouter.kRegisterView1);
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
      },
    );
  }
}
