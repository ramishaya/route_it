import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerState {
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;
  final bool isControllerInitialized;

  VideoPlayerState({
    required this.videoPlayerController,
    required this.chewieController,
    required this.isControllerInitialized,
  });
}

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(this.videoUrl)
      : super(VideoPlayerState(
          videoPlayerController: VideoPlayerController.network(''),
          chewieController: ChewieController(
            videoPlayerController: VideoPlayerController.network(''),
          ),
          isControllerInitialized: false,
        ));

  final String videoUrl;

  Future<void> initializeVideoPlayer() async {
    final videoPlayerController = VideoPlayerController.network(
      videoUrl,
    );

    await videoPlayerController.initialize();
    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );

    emit(VideoPlayerState(
      videoPlayerController: videoPlayerController,
      chewieController: chewieController,
      isControllerInitialized: true,
    ));
  }

  void togglePlayPause() {
    final currentState = state;
    if (currentState.videoPlayerController.value.isPlaying) {
      currentState.videoPlayerController.pause();
    } else {
      currentState.videoPlayerController.play();
    }
    emit(VideoPlayerState(
      videoPlayerController: currentState.videoPlayerController,
      chewieController: currentState.chewieController,
      isControllerInitialized: currentState.isControllerInitialized,
    ));
  }

  @override
  Future<void> close() {
    // print("we are closing the controllers ");
    state.videoPlayerController.dispose();
    state.chewieController.dispose();
    return super.close();
  }
}
