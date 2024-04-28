import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color outlineColor;
  final double outlineWidth;

  const CustomOutlinedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.outlineColor = darkPrimaryColor,
    this.outlineWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: lightPrimaryColor
        ),
        cursorColor: secondaryColor2,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12.0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: lightPrimaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: outlineColor,
              width: outlineWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
              width: outlineWidth,
            ),
          ),
        ),
      ),
    );
  }
}
