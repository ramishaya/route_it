import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_styles.dart';
import 'package:route_it/core/utils/assets_data.dart';

class CustomErrorItem extends StatelessWidget {
  const CustomErrorItem(
      {super.key, required this.errorMessage, required this.size});

  final String errorMessage;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            darkPrimaryColor,
            primaryColor,
            secondaryColor2,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: size.width * 0.1),
                width: size.width * 0.5,
                height: size.width * 0.5,
                child: Image.asset(
                  AssetsData.errorImg,
                  fit: BoxFit.cover,
                )),
            SubTitleText(text: errorMessage)
          ],
        )),
      ),
    );
  }
}
