import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo_impl.dart';
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
  getIt.get<RoadMapRepoImpl>().fetchSkillArticles(roadMapSkillId: 1);

  String? token = CacheServices.getData(key: "token");
  Object? widget;

  if (token != null) {
    widget = AppRouter.router.push(AppRouter.kHomeView);
  } else {
    widget = AppRouter.router.push(AppRouter.kLoginView);
  }

  runApp(RouteIT(
    firstView: widget,
  ));
}
