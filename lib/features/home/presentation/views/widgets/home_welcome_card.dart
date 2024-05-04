import 'package:flutter/material.dart';
import 'package:route_it/constants.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/core/widgets/custom_button_item.dart';

class HomeWelcomeCard extends StatelessWidget {
  const HomeWelcomeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.168,
      padding: EdgeInsets.all(size.width * horizintalMargin),
      decoration: BoxDecoration(
          image: const DecorationImage(
              //! remeber it
              // colorFilter: ColorFilter.mode(lightPrimaryColor, BlendMode.dstOver),
              image: AssetImage(AssetsData.welcomeImg),
              fit: BoxFit.cover),
          color: lightPrimaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 22,
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
            CustomButtonItem(
              textColor: textOnPrimaryColor,
              radius: 10,
              width: size.width * 0.267,
              height: size.height * 0.05,
              function: () {},
              text: "Start",
              backgroundColor: primaryColor,
            )
          ]),
    );
  }
}

// isUpperCase: false,
//               isItalic: true,
//               function: () {},
//               text: "Start",
//               width: size.width * 0.267,
//               height: size.height * 0.04