import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/features/home/presentation/views/widgets/category_card.dart';

import '../../../data/models/technology_category_model.dart';

class GridCardsBuilder extends StatelessWidget {
  const GridCardsBuilder({
    super.key,
    required this.size,
    required this.categoriesModel
  });

  final List<TechnologyCategoryModel> categoriesModel;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: size.width * 0.035,
        mainAxisSpacing: size.width * 0.035,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 3) {
              GoRouter.of(context).push(AppRouter.kTechCategoryView);
            }
          },
          child: CategoryCard(
            size: size,
            index: index,
          ),
        );
      },
    );
  }
}
