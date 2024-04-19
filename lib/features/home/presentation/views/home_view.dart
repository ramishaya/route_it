import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it/features/home/presentation/views/widgets/home_view_body.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<IconData> listOfIcons = const [
    Iconsax.home,
    Iconsax.lovely,
    Iconsax.profile_2user,
  ];

  final List<Widget> navPages = const [
    HomeViewBody(),
    Center(child: Text("Hello")),
    Center(child: Text("Hello")),
  ];

  @override
  Widget build(BuildContext context) {
    int currentTabIndex = 0;
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
      currentTabIndex = state.tabIndex;
      return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  radius: 1.2,
                  stops: const [0.3, 1.0],
                  center: const Alignment(-0.5, -0.3),
                  //focal: Alignment.topLeft,
                  colors: [
                    primaryColor,
                    darkPrimaryColor.withOpacity(0.5),
                  ])),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            bottomNavigationBar: CustomButtomNavBar(
                size: size,
                currentIndex: currentTabIndex,
                listOfIcons: listOfIcons),
            body: navPages.elementAt(currentTabIndex),
          ));
    });
  }
}
