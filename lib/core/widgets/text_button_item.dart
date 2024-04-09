// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

Widget defaultTextButton({
  required VoidCallback? function,
  required String text,
  Color color = primaryColor
}) => TextButton(
  onPressed: function,
  child: Text(
      text.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color
    ),
  ),
);