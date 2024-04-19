import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_it/core/utils/app_router.dart';
import 'package:route_it/core/utils/app_theme.dart';
import 'package:route_it/core/utils/bloc_observer.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheServices.init();
  setupServiceLocator();
  
  String? token = CacheServices.getData(key: "token");
  Object? widget;

    if(token != null) {
      widget = AppRouter.router.push(AppRouter.kHomeView);
    }
    else {
      widget = AppRouter.router.push(AppRouter.kLoginView);
    }
    
  runApp(RouteIT(
    firstView: widget,
  ));
}

class RouteIT extends StatelessWidget {
  const RouteIT({super.key, required this.firstView});

  final Object firstView;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
    );
  }
}
