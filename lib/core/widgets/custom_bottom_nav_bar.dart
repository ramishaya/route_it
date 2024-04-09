import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';

import '../../featuers/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required this.size,
    required this.currentIndex,
    required this.listOfIcons,
  });

  final Size size;
  final int currentIndex;
  final List<IconData> listOfIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(size.width * horizintalMargin),
      height: size.height * 0.07,
      width: 50,
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10)),
          ],
          borderRadius: BorderRadius.circular(50)),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.14),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                BlocProvider.of<BottomNavBarCubit>(context).tabChange(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: secondaryColor2,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? secondaryColor2
                        : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ));
        },
      ),
    );
  }
}
