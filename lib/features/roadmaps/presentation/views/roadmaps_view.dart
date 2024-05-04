import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/widgets/custom_back_button2.dart';
import 'package:route_it/core/widgets/custom_error_item.dart';

import 'package:route_it/features/roadmaps/presentation/views/widgets/roadmap_card.dart';
import 'package:route_it/features/roadmaps/presentation/views/widgets/roadmap_card_shimmer.dart';

import '../view_models/roadmaps_cubit/road_maps_cubit.dart';

class RoadMapsView extends StatelessWidget {
  const RoadMapsView({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkPrimaryColor,
      appBar: AppBar(
        leading: const CustomBackButton2(),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text("$level Road Maps"),
      ),
      body: BlocBuilder<RoadMapsCubit, RoadMapsState>(
        builder: (context, state) {
          if (state is RoadMapsLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(size.width * horizintalMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.roadmaps.map((roadmap) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                            AppRouter.kRoadMapsDetailsView,
                            extra: roadmap);
                      },
                      child: RoadMapCard(size: size, roadmap: roadmap));
                }).toList(),
              ),
            );
          } else if (state is RoadMapsFailure) {
            return CustomErrorItem(errorMessage: state.errMessage, size: size);
          } else {
            return ShimmerAnimationBuilder(size: size);
          }
        },
      ),
    );
  }
}

class ShimmerAnimationBuilder extends StatelessWidget {
  const ShimmerAnimationBuilder({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(size.width * horizintalMargin),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
                child: RoadMapCardShimmer(size: size),
              ),
            ),
          );
        },
      ),
    );
  }
}
