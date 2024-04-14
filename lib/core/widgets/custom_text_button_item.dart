// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

class CustomTextButtonItem extends StatelessWidget {
  CustomTextButtonItem({super.key, required this.function, required this.text , required this.color});

  final VoidCallback? function;
  final String text;
  Color color = primaryColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
            if (states.contains(MaterialState.pressed)) {
              return primaryColor;
            }
            return Colors.transparent;
          },
        ),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color
        ),
      ),
    );
  }
}
