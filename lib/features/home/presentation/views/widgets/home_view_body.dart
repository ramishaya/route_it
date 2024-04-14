// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';

import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/features/home/presentation/views/widgets/grid_cards_builder.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_welcome_card.dart';

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
            SizedBox(
              height: size.height * 0.03,
            ),
            HomeWelcomeCard(size: size),
            SizedBox(
              height: size.height * 0.03,
            ),

            Text(
              "Technologies",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

           GridCardsBuilder(size: size),
           SizedBox(
              height: size.height * 0.03,
            ),

            Text(
              "Trending",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: FontWeight.bold),
            ),

          
          ],
        ),
      ),
    ));
  }
}
