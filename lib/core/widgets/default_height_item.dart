import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/core/widgets/default_height.dart
class DefaultHeight extends StatelessWidget {
  const DefaultHeight({super.key, required this.size, required this.height});
=======
class DefaultHeightItem extends StatelessWidget {
  const DefaultHeightItem(
      {super.key, required this.size, required this.height});
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8:lib/core/widgets/default_height_item.dart

  final double height;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.height * height);
  }
}
