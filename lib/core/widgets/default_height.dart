import 'package:flutter/material.dart';

class DefaultHeight extends StatelessWidget {
  const DefaultHeight({super.key, required this.size, required this.height});

  final double height;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.height * height);
  }
}
