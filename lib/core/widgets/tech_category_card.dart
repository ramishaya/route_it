import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'dart:math' as math;

class TechCategoryCard extends StatelessWidget {
  const TechCategoryCard({super.key, required this.size, required this.index});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kTechnologyDetailsView);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.13,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              cardColors[index],
              cardColors[index],
            ]),
            //color: lightPrimaryColor,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: size.width * 0.05),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 20,
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Opacity(
                  opacity: 0.1,
                  child: SizedBox(
                      width: size.width * 0.40,
                      height: size.width * 0.40,
                      child: Image.asset(
                        AssetsData.categoryImg,
                      )),
                ),
              ),
            ),
            Positioned(
              right: size.width * horizintalMargin,
              bottom: size.height * 0.01,
              child: SizedBox(
                  width: size.width * 0.20,
                  height: size.width * 0.20,
                  child: Image.asset(
                    AssetsData.categoryImg,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
                bottom: size.height * 0.04,
                left: size.width * horizintalMargin,
                child: const Text(
                  "Front End",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
