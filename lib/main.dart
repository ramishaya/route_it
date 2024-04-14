import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: darkPrimaryColor.withOpacity(0.15),
      statusBarIconBrightness: Brightness.light));
  runApp(const RouteIT());
}

class RouteIT extends StatelessWidget {
  const RouteIT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
    );
  }
}
