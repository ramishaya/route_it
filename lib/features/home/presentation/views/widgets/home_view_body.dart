// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/widgets/custom_error_item.dart';
import 'package:route_it/features/home/presentation/view_models/techology_categories_cubit.dart/technology_categories_cubit.dart';
import 'package:route_it/features/home/presentation/views/widgets/grid_cards_builder.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_welcome_card.dart';
import 'package:shimmer/shimmer.dart';

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
            BlocBuilder<TechnologyCategoriesCubit, TechnologyCategoriesState>(
              builder: (context, state) {
                if (state is TechnologyCategoriesLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Technologies",
                        style: GoogleFonts.lato(
                            fontSize: MyTextStyles.titleSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      GridCardsBuilder(
                        size: size,
                        categoriesModel: state.technologyCategories,
                      ),
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
                  );
                } else if (state is TechnologyCategoriesFailure) {
                  return CustomErrorItem(
                      errorMessage: state.errMessage, size: size);
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.25,
                          height: size.height * 0.03,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: size.width * 0.035,
                            mainAxisSpacing: size.width * 0.035,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.25,
                          height: size.height * 0.03,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
