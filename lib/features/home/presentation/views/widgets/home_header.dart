// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/widgets/custom_circlar_icon_item.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader(
      {super.key,
      required this.size,
      required this.userName,
      required this.onTapFunction});

  final Size size;
  final String userName;
  final Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome Back", style: MyTextStyles.titleStyle),
            // InkWell(
            //   borderRadius: BorderRadius.circular(10),
            //   splashColor: Colors.transparent,
            //   focusColor: Colors.transparent,
            //   highlightColor: lightPrimaryColor,
            //   onTap: onTapFunction,
            //   child: const CircleAvatar(
            //     radius: 20,
            //     backgroundColor: lightPrimaryColor,
            //     child: Icon(Iconsax.notification_bing),
            //   ),
            // ),
            CustomCirclarIconItem(
                function: onTapFunction, icon: Icon(Iconsax.notification))
          ],
        ),
        Text(
          userName,
          style: const TextStyle(
            color: textOnPrimaryColor,
            fontSize: MyTextStyles.subTitleSize,
          ),
        ),
      ],
    );
  }
}
