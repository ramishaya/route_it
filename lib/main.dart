import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_it/core/utils/app_colors.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/app_theme.dart';
import 'package:route_it/core/utils/bloc_observer.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/core/utils/service_locator.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';
import 'package:route_it/features/home/presentation/views/home_view.dart';
import 'package:route_it/features/login/presentation/views/login_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // await CacheServices.init();
  setupServiceLocator();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: darkPrimaryColor.withOpacity(0.15),
      statusBarIconBrightness: Brightness.light));

  // getIt.get<SharedPref>().init();
  // String? token = CacheServices.getData(key: 'token');
  // Widget? widget;
  //
  //   if(token != null) {
  //     widget = const HomeView();
  //   } else {
  //     widget = LoginView();
  //   }
  runApp(const RouteIT(
    // firstView: widget,
  ));
}

class RouteIT extends StatelessWidget {
  const RouteIT({super.key});

  // final Widget firstView;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
    );
  }
}
