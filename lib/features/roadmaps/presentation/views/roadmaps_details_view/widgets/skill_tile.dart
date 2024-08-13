import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';

class SkillTile extends StatelessWidget {
  const SkillTile(
      {super.key,
      required this.title,
      required this.isComplete,
      required this.skillDescription});

  final String title, skillDescription;

  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: HelperFunctions.screenHeight(context) * 0.01),
      padding: EdgeInsets.all(HelperFunctions.screenWidth(context) * 0.04),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Icon(
            //! we put the isFree Variable to true or false if the student complete the skill task
            isComplete ? Iconsax.unlock : Iconsax.lock,
            color: isComplete ? Colors.green : AppColors.lightPrimaryColor,
          ),
          SizedBox(width: HelperFunctions.screenWidth(context) * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                    height: HelperFunctions.screenHeight(context) * 0.008),
                Text(
                  skillDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Icon(Iconsax.play, color: Colors.white),
        ],
      ),
    );
  }
}
