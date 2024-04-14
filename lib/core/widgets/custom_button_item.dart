// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem(
      {super.key,
      required this.backgroundColor,
      required this.function,
      required this.text,
      required this.width,
      required this.height,
      required this.radius,
      required this.textColor
      });

  final double width;
  final double height;

  final Color? backgroundColor;
  final bool isUpperCase = true;
  final double radius;
  final Function function;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: primaryColor,
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: lightPrimaryColor,
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
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
