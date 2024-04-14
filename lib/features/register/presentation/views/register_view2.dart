// ignore_for_file: body_might_complete_normally_nullable, depend_on_referenced_packages

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/widgets/custom_text_field_item.dart';
import 'package:route_it/core/widgets/image_picker_item.dart';

class RegisterView2 extends StatefulWidget {
  const RegisterView2({super.key});

  @override
  State<RegisterView2> createState() => _RegisterView2State();
}

List<String> options = ["option 1", "option 2"];

class _RegisterView2State extends State<RegisterView2> {
  File? image;
  var dateController = TextEditingController();
  String currentOption = options[0];

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imageParmanent = await saveImageParmanently(image.path);
      setState(() {
        this.image = imageParmanent;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future<File> saveImageParmanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future<ImageSource?> showImageSource(context) async {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 120,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Iconsax.camera),
              title: const Text("Camera"),
              onTap: () {
                pickCamera();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.gallery),
              title: const Text("gallery"),
              onTap: () {
                pickImage();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

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
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * horizintalMargin,
            vertical: size.height * verticalMargin,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image != null
                    ? Center(
                        child: buildImagePickerItem(
                          function: () async {
                            ImageSource? source =
                                await showImageSource(context);
                          },
                          imagePath: image!,
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () async {
                            ImageSource? source =
                                await showImageSource(context);
                          },
                          child: ClipOval(
                            child: Image.asset(
                              AssetsData.profileImg,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: size.height * .03,
                ),
                CustomTextFieldItem(
                  controller: dateController,
                  type: TextInputType.none,
                  validator: (value) {},
                  hint: "Enter your birthdate",
                  prefix: Iconsax.calendar,
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2007),
                      initialDate: DateTime(2007, 1, 1),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                      });
                    }
                  },
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                const Text(
                  "Are you IT student ??",
                  style: TextStyle(fontSize: MyTextStyles.subTitleSize),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                ListTile(
                  title: const Text("Yes I am IT student"),
                  leading: Radio(
                    groupValue: currentOption,
                    value: options[0],
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("No I am not IT student"),
                  leading: Radio(
                    groupValue: currentOption,
                    value: options[1],
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  // height: size.height * .05,
                  width: size.width ,
                  decoration: BoxDecoration(
                    color: lightPrimaryColor.withOpacity(.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownMenu(
                    width: size.width,
                    inputDecorationTheme: const InputDecorationTheme(
                      enabledBorder: InputBorder.none,
                      suffixIconColor: Colors.transparent
                    ),
                    leadingIcon: const Icon(
                      Iconsax.code,
                      color: primaryColor,
                    ),
                    label: const Text(
                      "university",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 15
                      ),
                    ),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: "DamascusUniversity", label: "Damascus University"),
                      DropdownMenuEntry(value: "TishreenUniversity", label: "Tishreen University"),
                      DropdownMenuEntry(value: "AlBaathUniversity", label: "Al-Baath University"),
                      DropdownMenuEntry(value: "AlFuratUniversity", label: "Al-Furat University"),
                      DropdownMenuEntry(value: "AleppoUniversity", label: "Aleppo University"),
                      DropdownMenuEntry(value: "AlAndalusUniversity", label: "Al-Andalus University"),
                      DropdownMenuEntry(value: "Other", label: "Other"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
