// ignore_for_file: sort_child_properties_last, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUpperCase = true,
  double radius = 10.0,
  required Function function,
  required String text,
}) => Container(
  height: 50.0,
  width : width,
  child: MaterialButton(
    highlightColor: Colors.transparent,
    onPressed: (){
      function();
    },
    splashColor: Colors.transparent,
    child: Text(
      isUpperCase? text.toUpperCase() : text,
      style: TextStyle(
        color: lightPrimaryColor,
      ),
    ),
  ),
  decoration: BoxDecoration(
    color: darkPrimaryColor,
    boxShadow: [
      BoxShadow(
        color: primaryColor!.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 4,
        offset: Offset(0, 3),
      ),
    ],
    borderRadius: BorderRadius.circular(10),
  ),
);