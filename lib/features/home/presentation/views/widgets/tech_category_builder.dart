
import 'package:flutter/material.dart';
import 'package:route_it/features/home/presentation/views/widgets/tech_category_card.dart';

class TechCategoryBuilder extends StatelessWidget {
  const TechCategoryBuilder({
    super.key,
    required this.itemCount,
    required this.size,
  });

  final int itemCount;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return TechCategoryCard(size: size, index: index);
      },
    );
  }
}
