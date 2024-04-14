import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

class LinearGradientContainer extends StatelessWidget {
  const LinearGradientContainer(
      {super.key, required this.size, required this.child});

  final Size size;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
              darkPrimaryColor.withOpacity(0.5),
              darkPrimaryColor,
            ])),
        child: child);
  }
}
