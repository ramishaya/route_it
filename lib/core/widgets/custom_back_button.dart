import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, required this.onTapFunction, required this.size, required this.width, required this.height});
  final Size size;
  final double width;
  final double height;
  final Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapFunction,
        child: Container(
          width: size.width * 0.01,
          height: size.height * 0.01,
          decoration: BoxDecoration(
            color: lightPrimaryColor,
            borderRadius: BorderRadius.circular(curv),
          ),
          child: const Center(
              child: Icon(
            Iconsax.arrow_left_24,
          )),
        ));
  }
}
