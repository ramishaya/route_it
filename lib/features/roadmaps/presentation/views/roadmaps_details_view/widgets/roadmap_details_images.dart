import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';
import 'package:route_it/core/widgets/cached_network_image.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/page_index_cubit/page_index_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoadMapDetailsImages extends StatelessWidget {
  const RoadMapDetailsImages({
    super.key,
    required this.roadMapModel,
  });

  final RoadMapModel roadMapModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, int>(
      builder: (context, pageIndex) {
        final pageController =
            BlocProvider.of<PageIndexCubit>(context).pageController;
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: HelperFunctions.screenHeight(context) * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: HelperFunctions.screenHeight(context) * 0.25,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<PageIndexCubit>(context)
                        .setPageIndex(index);
                  },
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: HelperFunctions.screenWidth(context) * 0.02),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                          child: CachedNetworkImg(
                              width: HelperFunctions.screenWidth(context),
                              height:
                                  HelperFunctions.screenHeight(context) * 0.25,
                              img: roadMapModel.cover!,
                              placeHolder: AssetsData.placeHolderImg)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: HelperFunctions.screenWidth(context) * 0.02),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                          child: CachedNetworkImg(
                              width: HelperFunctions.screenWidth(context),
                              height:
                                  HelperFunctions.screenHeight(context) * 0.25,
                              img: roadMapModel.cover!,
                              placeHolder: AssetsData.placeHolderImg)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: HelperFunctions.screenHeight(context) * 0.02,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.secondaryColor,
                  dotColor: AppColors.lightPrimaryColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
