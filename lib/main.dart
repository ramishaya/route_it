import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_it/features/company/data/models/company_profile_model.dart';
import 'package:route_it/features/company/data/repos/company_repo_impl.dart';
import 'package:route_it/features/competition/data/repos/competition_repo_impl.dart';
import 'package:route_it/features/search/data/repos/search__repo_impl.dart';
import 'package:route_it/route_it.dart';
import 'package:route_it/core/utils/router/app_router.dart';
import 'package:route_it/core/utils/dependency_management/bloc_observer.dart';
import 'package:route_it/core/utils/local_storage/cache_services.dart';
import 'package:route_it/core/utils/dependency_management/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheServices.init();
  setupServiceLocator();
  getIt.get<SearchRepoImpl>().generalSearch(name: "rami");

  String? token = CacheServices.getData(key: "token");
  Object? widget;
  //getIt.get<RoadMapRepoImpl>().roadMapRanking(roadMapId: 2);
  if (token != null) {
    widget = AppRouter.router.push(AppRouter.kHomeView);
  } else {
    widget = AppRouter.router.push(AppRouter.kLoginView);
  }

  runApp(RouteIT(
    firstView: widget,
  ));
}
