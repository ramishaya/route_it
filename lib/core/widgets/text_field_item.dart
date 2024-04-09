
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  required String? Function(String?) validator,
  required String hint,
  required IconData prefix,
  Color? color1,
  Color? color2,
  Color color3 = subTitleColor,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        color: lightPrimaryColor.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onFieldSubmitted: onSubmit != null ? (s) => onSubmit() : null,
        onChanged: onChange,
        validator: validator,
        keyboardType: type,
        obscureText: isPassword,
        cursorColor: primaryColor,
        style: TextStyle(
            color: lightPrimaryColor,
            fontStyle: FontStyle.normal
        ),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            color: primaryColor,
            fontStyle: FontStyle.italic,
            fontSize: 15
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: primaryColor,
                  style: BorderStyle.none
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon:
          Icon(
            prefix,
            color: primaryColor,
          ),
          suffixIcon: suffix != null ? IconButton(
              onPressed: ()
              {
                suffixPressed!();
              },
              icon: Icon(suffix,color: primaryColor,)) : null,
        ),
      ),
    );