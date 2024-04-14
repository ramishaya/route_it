// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

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
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
