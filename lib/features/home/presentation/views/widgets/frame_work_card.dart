import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/core/utils/styles/app_styles.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';

class FrameWorkCard extends StatelessWidget {
  const FrameWorkCard(
      {super.key, required this.size, required this.loadedTehchnology});

  final Size size;
  final TechnologiesModel loadedTehchnology;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kFrameWorkDetailsView , extra: loadedTehchnology) ;
        },
        child: Container(
          width: size.width * 0.90,
          height: size.height * 0.32,
          margin: EdgeInsets.only(bottom: size.width * horizintalMargin),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.darkPrimaryColor,
              border: Border.all(
                  color: const Color(0xFFFFFFFF).withOpacity(0.5), width: 0.3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * horizintalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadedTehchnology.name!,
                      style: const TextStyle(
                          fontSize: MyTextStyles.titleSize,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    Text(
                      "${loadedTehchnology.description!.split(' ').take(6).join(' ')}....",
                      style: const TextStyle(
                        fontSize: MyTextStyles.subTitleSize,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Hero(
                    tag: loadedTehchnology.id!,
                    child: CachedNetworkImage(
                      width: size.width,
                      height: size.width * 0.20,
                      imageUrl: loadedTehchnology.image!,
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return Image.asset(
                          AssetsData.placeHolderImg,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
