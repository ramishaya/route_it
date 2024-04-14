// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

<<<<<<< HEAD:lib/core/widgets/custom_button_item.dart
class CustomButtonItem extends StatelessWidget {
  CustomButtonItem(
      {super.key, this.background, required this.function, required this.text});

  double width = double.infinity;
  final Color? background;
  final bool isUpperCase = true;
  final double radius = 10.0;
  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
=======
Widget defaultButton({
  double width = double.infinity,
  double height = 50.0,
  Color? background,
  bool isUpperCase = true,
  bool isItalic = false,
  double radius = 10.0,
  required Function function,
  required String text,
  required Color color,
}) =>
    Container(
      height: height,
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8:lib/core/widgets/button_item.dart
      width: width,
      child: MaterialButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
<<<<<<< HEAD:lib/core/widgets/custom_button_item.dart
        highlightColor: primaryColor,
=======
        highlightColor:Colors.transparent,
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8:lib/core/widgets/button_item.dart
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
<<<<<<< HEAD:lib/core/widgets/custom_button_item.dart
          style: const TextStyle(
            color: lightPrimaryColor,
=======
          style: TextStyle(
            fontStyle: isItalic ?FontStyle.italic : FontStyle.normal,
            color: color,
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8:lib/core/widgets/button_item.dart
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
