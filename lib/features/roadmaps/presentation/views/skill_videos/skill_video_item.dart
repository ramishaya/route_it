import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/video_player_cubit/video_player_cubit.dart'; // Import the VideoPlayerCubit

class SkillVideoItem extends StatelessWidget {
  const SkillVideoItem(
      {super.key, required this.videoTitle, required this.videoUrl});
  final String videoTitle;
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoPlayerCubit(videoUrl)..initializeVideoPlayer(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(videoTitle),
            leading: InkWell(
              splashColor: AppColors.lightPrimaryColor,
              highlightColor: AppColors.lightPrimaryColor,
              focusColor: AppColors.lightPrimaryColor,
              borderRadius: BorderRadius.circular(70),
              onTap: () async {
                GoRouter.of(context).pop();
                await BlocProvider.of<VideoPlayerCubit>(context).close();
              },
              child: const Icon(
                Iconsax.arrow_left_24,
                size: 30,
                color: Colors.white,
              ),
            )),
        body: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
          builder: (context, state) {
            if (state.isControllerInitialized) {
              return Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: state.chewieController),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
