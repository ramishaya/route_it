import 'package:flutter/material.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';

class VideoCard extends StatelessWidget {
  final String category;
  final String title;
  final String imagePath;
  final double progress;

  const VideoCard({
    super.key,
    required this.category,
    required this.title,
    required this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      elevation: 1,
      margin: EdgeInsets.symmetric(
        vertical: HelperFunctions.screenWidth(context) * 0.02,
        horizontal: HelperFunctions.screenWidth(context) * horizintalMargin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(width: HelperFunctions.screenWidth(context) * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Completed',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: AppColors.secondaryColor,
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
