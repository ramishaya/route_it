import 'package:flutter/material.dart';

class DefaultHeightItem extends StatelessWidget {
  const DefaultHeightItem(
      {super.key, required this.size, required this.height});

  final double height;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.height * height);
  }
}
