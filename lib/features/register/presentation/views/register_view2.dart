import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';
import 'package:route_it/core/widgets/custom_date_picker.dart';
import 'package:route_it/core/widgets/custom_image_picker.dart';
import 'package:route_it/core/widgets/custom_outlined_text_field.dart';
import 'package:route_it/core/widgets/custom_radio_list.dart';
import 'package:route_it/core/widgets/custom_dropdown_menu.dart';
import 'package:route_it/features/register/presentation/view_models/radio_cubit/radio_cubit.dart';
import 'package:route_it/features/register/presentation/view_models/register2_cubit/register2_cubit.dart';

class RegisterView2 extends StatelessWidget {
  const RegisterView2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var dateController = TextEditingController();
    var collegeController = TextEditingController();
    var bioController = TextEditingController();

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButtonItem(
                  backgroundColor: darkPrimaryColor,
                  function: (){
                    GoRouter.of(context).pop();
                  },
                  text: "back",
                  width: 160,
                  height: 40,
                  radius: 10,
                  textColor: lightPrimaryColor,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButtonItem(
                  backgroundColor: darkPrimaryColor,
                  function: (){},
                  text: "sign up",
                  width: 160,
                  height: 40,
                  radius: 10,
                  textColor: lightPrimaryColor,
                ),
              )
            ],
          ),
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
                  size: size.height * .13,
                  options: const [
                    "I am an IT student.",
                    "I am not an IT student.",
                  ],
                ),
                Visibility(
                  visible: RadioCubit.get(context).currentIndex == 1 ? true : false,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: false,
                  replacement: Container(),
                  child: CustomDropdownMenu(
                    controller: collegeController,
                    size: size.height * .21,
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
  }
}
