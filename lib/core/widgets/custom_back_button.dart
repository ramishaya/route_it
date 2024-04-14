import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key,
      required this.onTapFunction,
      required this.size,
      required this.width,
      required this.height});
  final Size size;
  final double width;
  final double height;
  final Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).pop;
        },
        child: const SizedBox(
          width: 30,
          height: 30,
          child:  Center(
              child: Icon(
            size: 25,
            Iconsax.arrow_left_24,
          )),
        ));
  }
}
