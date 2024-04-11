import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/my_text_styles.dart';

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
            const Text("Welcome Back", style: MyTextStyles.titleStyle),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTapFunction,
              child: const CircleAvatar(
                radius: 16.3,
                backgroundColor: lightPrimaryColor,
                child: Icon(
                  Iconsax.notification_bing,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: size.height * 0.001),
        // here we print the user name that comes from the login page
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
