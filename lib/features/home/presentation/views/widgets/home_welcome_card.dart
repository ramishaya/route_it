import 'package:flutter/material.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/widgets/button_item.dart';

class HomeWelcomeCard extends StatelessWidget {
  const HomeWelcomeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.174,
      padding: EdgeInsets.all(size.width * horizintalMargin),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsData.welcomeImg), fit: BoxFit.cover),
          color: lightPrimaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              shadows: [],
            ),
            children: [
              TextSpan(
                text: 'What would you like\n',
              ),
              TextSpan(
                text: 'To Learn \n',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: 'Today?',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.067),
          child: defaultButton(
              color: Colors.white,
              isUpperCase: false,
              isItalic: true,
              function: () {},
              text: "Start",
              width: size.width * 0.267,
              height: size.height*0.04),
        )
      ]),
    );
  }
}
