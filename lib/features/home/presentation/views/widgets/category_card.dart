import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'dart:math' as math;

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.size, required this.index});
  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [cardColors[index], cardColors[index],]),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: lightPrimaryColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Transform.rotate(
              angle: -math.pi / 7,
              child: Opacity(
                opacity: 0.1,
                child: SizedBox(
                    width: size.width * 0.40,
                    height: size.width * 0.40,
                    child: index == 3
                        ? Image.asset(
                            AssetsData.categoryImg2,
                          )
                        : Image.asset(
                            AssetsData.categoryImg,
                          )),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.12,
            right: size.width * 0.12,
            top: size.width * 0.09,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: size.width * 0.20,
                    height: size.width * 0.20,
                    child: index == 3
                        ? Image.asset(
                            AssetsData.categoryImg2,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            AssetsData.categoryImg,
                            fit: BoxFit.cover,
                          )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                index == 3
                    ? Text(
                        "Explore",
                        style: GoogleFonts.lato(
                            fontSize: MyTextStyles.subTitleSize),
                      )
                    : Text(
                        "Front End",
                        style: GoogleFonts.lato(
                            fontSize: MyTextStyles.subTitleSize),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
