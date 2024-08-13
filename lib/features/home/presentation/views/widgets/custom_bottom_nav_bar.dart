import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it/core/utils/constants/constants_numbers.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

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
      height: size.width * .155,
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        boxShadow: [
          BoxShadow(
            //! reset the shadow color later
            color: Colors.grey.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(curv),
      ),
      child: ListView.builder(
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * horizintalMargin),
          child: InkWell(
            onTap: () {
              BlocProvider.of<BottomNavBarCubit>(context).tabChange(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: size.width * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? size.width * .12 : 0,
                      width: index == currentIndex ? size.width * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.white.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(curv),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .2125,
                      alignment: Alignment.center,
                      child: Icon(
                        listOfIcons[index],
                        size: size.width * .076,
                        color:
                            index == currentIndex ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
