import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/widgets/custom_back_button.dart';
import 'package:route_it/core/widgets/default_height_item.dart';
import 'package:route_it/core/widgets/gradient_container.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          height: 0.01,
          width: 0.01,
          size: size,
          onTapFunction: GoRouter.of(context).pop,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GradientContainer(
        size: size,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * horizintalMargin,
              vertical: size.height * verticalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose your Level",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              DefaultHeightItem(size: size, height: 0.03),
              const Text("we prepare a special road maos for each level")
            ],
          ),
        )),
      ),
    );
  }
}
