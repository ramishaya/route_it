// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/widgets/gradient_container.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientContainer(
        size: size,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * horizintalMargin , vertical: size.height * verticalMargin),
          child: ListView.builder(
            itemBuilder: (context , index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * horizintalMargin , vertical: size.height * verticalMargin),
                  child: Container(
                      height: size.height * .2,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: lightPrimaryColor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(curv)
                      ),
                      child: Center(
                        child: Text(
                            "taim"
                        ),
                      )
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      )
    );
  }
}
