// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

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
      width: width,
      child: MaterialButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontStyle: isItalic ?FontStyle.italic : FontStyle.normal,
            color: color,
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
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
