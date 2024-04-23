import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_it/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: darkPrimaryColor.withOpacity(0.15),
        statusBarIconBrightness: Brightness.light));

    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: "Ubuntu"
      ),
      primaryColor: primaryColor,
      splashColor: secondaryColor2,
      primaryColorDark: primaryColor
    );
  }

  static ThemeData lightTheme(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.15),
        statusBarIconBrightness: Brightness.dark));

    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: "Ubuntu",
      ),
    );
  }
}
