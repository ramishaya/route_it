// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';
<<<<<<< HEAD
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/widgets/default_height.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_welcome_card.dart';

List<Color> cardColors = [
  Color(0XFFfa7921),
  Color(0XFFffb7ff),
  Color(0XFF3bf4fb),
  Color(0XFFcaff8a)
];
=======
import 'package:route_it/core/utils/my_text_styles.dart';
import 'package:route_it/core/widgets/grid_cards_builder.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_welcome_card.dart';

import '../../../../../core/widgets/default_height_item.dart';
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * horizintalMargin,
            vertical: size.height * verticalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(
              size: size,
              userName: "Rami Shaya",
              onTapFunction: () {
                //! here we Navigate to the notifications Screen
              },
            ),
            DefaultHeightItem(size: size, height: 0.03),
            HomeWelcomeCard(size: size),
<<<<<<< HEAD
            DefaultHeight(size: size, height: 0.03),
=======
            DefaultHeightItem(size: size, height: 0.03),

>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8
            Text(
              "Technologies",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: FontWeight.bold),
            ),
<<<<<<< HEAD
            DefaultHeight(size: size, height: 0.03),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.035,
                mainAxisSpacing: size.width * 0.035,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 3) {
                      GoRouter.of(context).push(AppRouter.kDomainsView);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [cardColors[index] , subTitleColor]),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: lightPrimaryColor.withOpacity(.4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 60,
                            height: 60,
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
                );
              },
            ),
            DefaultHeight(size: size, height: 0.03),
=======
            DefaultHeightItem(size: size, height: 0.03),
            GridCardsBuilder(size: size),
            DefaultHeightItem(size: size, height: 0.03),
>>>>>>> d88fadebd2b6a51d29030afe4ca3e360106afaa8

            Text(
              "Trending",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: FontWeight.bold),
            ),

            //  SizedBox(
            //   height: size.height*0.04,
            // ),
            // const Text("Start Your Road Map \n with us!",
            //     style: MyTextStyles.titleStyle)
          ],
        ),
      ),
    ));
  }
}
