import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String author;
  final String timeAgo;
  final String category;
  final Color categoryColor;

  const ArticleCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.author,
    required this.timeAgo,
    required this.category,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      elevation: 1,
      margin: EdgeInsets.symmetric(
          vertical: HelperFunctions.screenWidth(context) * 0.02,
          horizontal: HelperFunctions.screenWidth(context) * horizintalMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: HelperFunctions.screenWidth(context) * 0.25,
                height: HelperFunctions.screenWidth(context) * 0.35,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(imagePath),
                      ),
                      SizedBox(
                          width: HelperFunctions.screenWidth(context) * 0.02),
                      Text(
                        author,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                          width: HelperFunctions.screenWidth(context) * 0.012),
                      Text(
                        '•',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                          width: HelperFunctions.screenWidth(context) * 0.012),
                      Text(
                        timeAgo,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: HelperFunctions.screenWidth(context) * 0.02),
                  Text(
                    title,
                    style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: HelperFunctions.screenWidth(context) * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: categoryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          category,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const Icon(Iconsax.bookmark_2)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
