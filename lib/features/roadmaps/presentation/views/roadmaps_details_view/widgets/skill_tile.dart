import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/dependency_management/service_locator.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo_impl.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/add_comment_cubit/add_comment_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_comments/skill_comments.dart';

class SkillTile extends StatelessWidget {
  const SkillTile(
      {super.key,
      required this.title,
      required this.isComplete,
      required this.skillDescription,
      required this.skill});

  final String title, skillDescription;

  final bool isComplete;
  final RoadMapSkillsModel skill;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                GoRouter.of(context).push(AppRouter.kSkillView, extra: skill),
            child: Row(
              children: [
                Icon(
                  isComplete ? Iconsax.unlock : Iconsax.lock,
                  color:
                      isComplete ? Colors.green : AppColors.lightPrimaryColor,
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
                          height:
                              HelperFunctions.screenHeight(context) * 0.008),
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
          ),
          SizedBox(height: HelperFunctions.screenHeight(context) * 0.01),
          GestureDetector(
            onTap: () {
              _showCommentsBottomSheet(context);
            },
            child: Image.asset(
              width: HelperFunctions.screenWidth(context) * 0.07,
              height: HelperFunctions.screenHeight(context) * 0.03,
              "assets/images/comment.png",
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      isScrollControlled: true, // Makes the bottom sheet full-screen
      backgroundColor: AppColors.darkPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      CommentsCubit(getIt.get<RoadMapRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) => AddCommentCubit(getIt.get<RoadMapRepoImpl>()),
                ),
              ],
              child: SkillComments(
                scrollController: scrollController,
                skillId: skill.id!,
              ),
            );
          },
        );
      },
    );
  }
}
