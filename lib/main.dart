import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/app_theme.dart';
import 'package:route_it/core/utils/bloc_observer.dart';
import 'package:route_it/core/utils/service_locator.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';
import 'package:route_it/features/home/data/repo/home_repo_impl.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: darkPrimaryColor.withOpacity(0.15),
      statusBarIconBrightness: Brightness.light));
  getIt.get<HomeRepoImpl>().fetchAllCategories();
  //SharedPref.init();
  // getIt.get<SharedPref>().init();
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
