// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/widgets/button_item.dart';
import 'package:route_it/core/widgets/divider_item.dart';
import 'package:route_it/core/widgets/text_button_item.dart';
import 'package:route_it/core/widgets/text_field_item.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                darkPrimaryColor,
                primaryColor,
                secondaryColor2,
              ]
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login now",
                        style: TextStyle(
                            color: lightPrimaryColor,
                            fontSize: 45,
                            fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * .05,),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Your Email Address !';
                            }
                            return null;
                          },
                          hint: "EMAIL" ,
                          prefix: Iconsax.message
                      ),
                      SizedBox(height: size.height * .01,),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Password is too Short !';
                            }
                            return null;
                          },
                          hint: "PASSWORD" ,
                          prefix: Iconsax.lock,
                          suffix: Iconsax.eye_slash
                      ),
                      SizedBox(height: size.height * .03,),
                      defaultButton(
                        color: lightPrimaryColor,
                        function: (){
                          GoRouter.of(context).push(AppRouter.kHomeView);
                        },
                        text: "sign in",
                      ),
                      SizedBox(height: size.height * .04,),
                      myDivider(),
                      SizedBox(height: size.height * .02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'Don\'t have an account ? ',
                            style: TextStyle(
                                color: lightPrimaryColor,
                                fontSize: 15
                            ),
                          ),
                          SizedBox(width: size.width * .01),
                          defaultTextButton(
                              function: ()
                              {
                                GoRouter.of(context).push(AppRouter.kRegisterView1);
                              },
                              text: 'register',
                              color: secondaryColor
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
