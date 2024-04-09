import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/utils/my_text_styles.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(
              size: size,
              userName: "Rami Shaya",
              onTapFunction: () {
                //! here we Navigate to the Navigations Screen
              },
            ),
            SizedBox(height: size.height * 0.03),
            HomeWelcomeCard(size: size),
            SizedBox(height: size.height * 0.03),

            Text(
              "Technologies",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: MyTextStyles.titleWeight),
            ),
            SizedBox(height: size.height * 0.03),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.035,
                mainAxisSpacing: size.height * 0.02,
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0XFF3e3367),
                        Color(0XFF746d93),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: lightPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
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
                          height: size.height * 0.04,
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
            SizedBox(height: size.height * 0.03),

            Text(
              "Trending",
              style: GoogleFonts.lato(
                  fontSize: MyTextStyles.titleSize,
                  fontWeight: MyTextStyles.titleWeight),
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
