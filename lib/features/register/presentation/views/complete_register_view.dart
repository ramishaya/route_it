import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/core/utils/styles/app_styles.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/local_storage/cache_services.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_date_picker.dart';
import 'package:route_it/core/widgets/custom_outlined_text_field.dart';
import 'package:route_it/core/widgets/custom_toast.dart';
import 'package:route_it/features/register/presentation/view_models/complete_register_cubit/complete_register_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/image_picker_cubit/image_picker_cubit.dart';

class CompleteRegisterView extends StatelessWidget {
  const CompleteRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dateController = TextEditingController();
    //var collegeController = TextEditingController();
    var bioController = TextEditingController();

    return BlocConsumer<CompleteRegisterCubit, CompleteRegisterState>(
      listener: (context, state) {
        if (state is CompleteRegisterSucces) {
          showToast(state.succesMessage, ToastState.SUCCESS);
          // ignore: avoid_print, prefer_interpolation_to_compose_strings
          print("this is our token" + CacheServices.getData(key: "token"));
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is CompleteRegisterFailure) {
          showToast(state.failureMessage, ToastState.ERROR);
          // GoRouter.of(context).pushReplacement(AppRouter.kRegisterView1);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
               AppColors. darkPrimaryColor,
               AppColors. primaryColor,
               AppColors. secondaryColor2,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                "Complete Register",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MyTextStyles.titleSize,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: const CustomBackButton2(),
            ),
            body: BlocBuilder<ImagePickerCubit, ImagePickerState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              BlocProvider.of<ImagePickerCubit>(context)
                                  .pickImage(),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CircleAvatar(
                                  radius: 64.0,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: state is ImagePickerSuccess
                                      ? FileImage(state.image)
                                          as ImageProvider<Object>
                                      : const AssetImage(AssetsData.avatarImg)
                                          as ImageProvider<Object>),
                              const CircleAvatar(
                                radius: 12,
                                backgroundColor:AppColors. primaryColor,
                                child: Icon(Icons.edit,
                                    size: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        CustomDatePicker(
                          dateController: dateController,
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        CustomOutlinedTextField(
                          controller: bioController,
                          hintText: 'Type some details about you....',
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        // CustomRadioList(
                        //   size: size.height * .13,
                        //   options: const [
                        //     "I am an IT student.",
                        //     "I am not an IT student.",
                        //   ],
                        // ),
                        // BlocBuilder<RadioCubit, RadioState>(
                        //   builder: (context, state) {
                        //     return Visibility(
                        //       // visible: RadioCubit.get(context).isMenuVisibilty,
                        //       visible: RadioCubit.get(context).currentIndex == 0
                        //           ? true
                        //           : false,
                        //       maintainState: true,
                        //       maintainAnimation: true,
                        //       maintainSize: false,
                        //       replacement: Container(),
                        //       child: CustomDropdownMenu(
                        //         controller: collegeController,
                        //         size: size.height * .21,
                        //       ),
                        //     );
                        //   },
                        // ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        CustomButtonItem(
                          backgroundColor:AppColors. darkPrimaryColor,
                          function: () {
                            BlocProvider.of<CompleteRegisterCubit>(context)
                                .completeRegister(
                                    profileImage: state is ImagePickerSuccess
                                        ? state.image
                                        : File(""),
                                    birthDate: "2000-01-01",
                                    isItStudent: "1",
                                    university: "Aleppo University",
                                    bio: "Dont's have a bio yet");
                          },
                          text: "Complete Register",
                          width: double.infinity,
                          height: size.height * 0.05,
                          radius: 10,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
