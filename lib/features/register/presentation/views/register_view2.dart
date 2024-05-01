import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_date_picker.dart';
import 'package:route_it/core/widgets/custom_image_picker.dart';
import 'package:route_it/core/widgets/custom_outlined_text_field.dart';
import 'package:route_it/core/widgets/custom_radio_list.dart';
import 'package:route_it/core/widgets/custom_dropdown_menu.dart';
import 'package:route_it/core/widgets/custom_toast.dart';
import 'package:route_it/features/register/presentation/view_models/radio_cubit/radio_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/register2_cubit/register2_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:route_it/features/register/presentation/views/register_view1.dart';

class RegisterView2 extends StatelessWidget {
  const RegisterView2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dateController = TextEditingController();
    var collegeController = TextEditingController();
    var bioController = TextEditingController();
    List<TextEditingController> isStudentController = [
      TextEditingController(),
      TextEditingController(),
    ];

    return BlocConsumer<Register2Cubit , Register2State>(
      listener: (context , state){},
      builder: (context , state){
        return BlocBuilder<RegisterCubit, RegisterState>(
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
                  ],
                ),
              ),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .03,
                        ),
                        const CustomImagePicker(),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        CustomDatePicker(
                          dateController: dateController,
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        CustomOutlinedTextField(
                          controller: bioController,
                          hintText: 'Type some details about you....',
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        CustomRadioList(
                          controllers: isStudentController,
                          size: size.height * .13,
                          options: const [
                            "I am an IT student.",
                            "I am not an IT student.",
                          ],
                        ),
                        BlocBuilder<RadioCubit, RadioState>(
                          builder: (context, state) {
                            return Visibility(
                              // visible: RadioCubit.get(context).isMenuVisibilty,
                              visible: RadioCubit.get(context).currentIndex == 0
                                  ? true
                                  : false,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: false,
                              replacement: Container(),
                              child: CustomDropdownMenu(
                                controller: collegeController,
                                size: size.height * .21,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButtonItem(
                            function: () {
                                BlocProvider.of<RegisterCubit>(context).register(
                                  name: RegisterView1.nameController.text,
                                  email: RegisterView1.emailController.text,
                                  password: RegisterView1.passwordController.text,
                                  passpasswordConfirmation: RegisterView1.confirmationPasswordController.text,
                                );

                                BlocProvider.of<Register2Cubit>(context).completeRegister(
                                  email: RegisterView1.emailController.text,
                                  birthDate: dateController.text,
                                  bio: bioController.text,
                                  itStudent: isStudentController.toString(),
                                  university: collegeController.text,
                                );
                            },
                            text: "sign up",
                            width: double.infinity,
                            height: 50,
                            radius: 10,
                            textColor: darkPrimaryColor,
                          ),
                        ),
                        // BlocProvider(
                        //   create: (context) => RadioCubit(),
                        //   child: BlocBuilder<RadioCubit , RadioState>(
                        //       builder : (context , state) {
                        //         late Widget widget;
                        //         if(RadioCubit.get(context).getCurrentIndex() == 0){
                        //           widget = CustomDropdownMenu(
                        //             controller: collegeController,
                        //             size: size.height * .35,
                        //           );
                        //         }else if(RadioCubit.get(context).getCurrentIndex() == 1){
                        //           widget = Container();
                        //         }
                        //         return widget ;
                        //       },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
