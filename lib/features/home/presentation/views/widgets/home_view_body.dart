// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/widgets/custom_error_item.dart';
import 'package:route_it/features/home/presentation/view_models/techology_categories_cubit.dart/technology_categories_cubit.dart';
import 'package:route_it/features/home/presentation/views/widgets/grid_cards_builder.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_shimmer.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_welcome_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () {
        return BlocProvider.of<TechnologyCategoriesCubit>(context)
            .fetchAllCategories();
      },
      color: primaryColor,
      backgroundColor: lightPrimaryColor,
      child: SafeArea(
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
                BlocBuilder<TechnologyCategoriesCubit,
                    TechnologyCategoriesState>(
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
                            categoriesList: state.technologyCategories,
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
                      return HomeShimmer(size: size);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
