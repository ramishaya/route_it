import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/skill_videos_cubit/skill_videos_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/views/skill_videos/widgets/video_card.dart';

class SkillVideosView extends StatelessWidget {
  const SkillVideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<SkillVideosCubit, SkillVideosState>(
      builder: (context, state) {
        if (state is SkillVideosLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.videos.length,
              itemBuilder: (context, index) => InkWell(
                    //! dont  forget to pass the video URL to the Next Screen
                    onTap: () => GoRouter.of(context).push(
                        AppRouter.kSkillVideoItem,
                        extra: state.videos[index]),
                    child: VideoCard(
                      title: state.videos[index].title!,
                      imagePath: AssetsData.welcomeImg,
                      category: "Programing",
                      progress: 25,
                    ),
                  ) // herre we will put the Course Video Card

              );
        } else if (state is SkillVideosLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.whiteColor,
          ));
        } else {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.whiteColor));
        }
      },
    ));
  }
}
