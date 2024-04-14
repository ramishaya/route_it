import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child ,  required this.size});

  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 1.2,
              stops: const [0.3, 1.0],
              center: const Alignment(-0.5, -0.3),
              //focal: Alignment.topLeft,
              colors: [
                primaryColor,
                darkPrimaryColor.withOpacity(0.5),
              ])),
      child: child
    );
  }
}
