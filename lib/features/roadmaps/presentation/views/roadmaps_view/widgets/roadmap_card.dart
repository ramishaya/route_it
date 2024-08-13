import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/core/widgets/cached_network_image.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';

class RoadMapCard extends StatelessWidget {
  const RoadMapCard({
    super.key,
    required this.roadmap,
  });

  final RoadMapModel roadmap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidth(context),
      margin: EdgeInsets.only(
          bottom:
              (HelperFunctions.screenWidth(context) * horizintalMargin) * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoadMapCardCover(roadmap: roadmap),

          /// here we fetch the Expert Name and Image
          Container(
            padding: EdgeInsets.all(
                HelperFunctions.screenWidth(context) * horizintalMargin),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AssetsData.avatarImg),
                ),
                SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ellen Lupton',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('Author and educator, MICA',
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              ],
            ),
          ),

          /// here we put the Road Map Title
          Padding(
            padding: EdgeInsets.only(
              left: HelperFunctions.screenWidth(context) * horizintalMargin,
              right: HelperFunctions.screenWidth(context) * horizintalMargin,
              bottom: HelperFunctions.screenWidth(context) * horizintalMargin,
            ),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '${roadmap.title}:',
                    style: Theme.of(context).textTheme.headlineMedium),
                TextSpan(
                    text:
                        '  ${roadmap.description!.split(' ').take(5).join(' ')} ....',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontStyle: FontStyle.italic)),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    HelperFunctions.screenWidth(context) * horizintalMargin,
                vertical:
                    HelperFunctions.screenWidth(context) * horizintalMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '36h · 15 Skills ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * 0.15,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.kRoadMapsDetailsView, extra: roadmap);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Icon(
                          Iconsax.play,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoadMapCardCover extends StatelessWidget {
  const RoadMapCardCover({
    super.key,
    required this.roadmap,
  });

  final RoadMapModel roadmap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25), bottom: Radius.circular(25)),
          child: CachedNetworkImg(
              img: roadmap.cover!,
              placeHolder: AssetsData.placeHolderImg,
              width: HelperFunctions.screenWidth(context),
              height: HelperFunctions.screenHeight(context) * 0.23),
        ),
        Positioned(
            top: HelperFunctions.screenWidth(context) * horizintalMargin,
            right: HelperFunctions.screenWidth(context) * horizintalMargin,
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                child: Center(
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
