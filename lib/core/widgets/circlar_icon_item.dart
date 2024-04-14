// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

Widget buildCirclarIconItem({required function, Icon? icon}) => InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: lightPrimaryColor,
      onTap: function,
      child: CircleAvatar(
        radius: 16.8,
        backgroundColor: lightPrimaryColor,
        child: icon,
      ),
    );
