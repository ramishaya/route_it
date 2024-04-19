import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/repo/technology_categories_repo_impl.dart';
import 'package:route_it/features/home/data/repo/technology_repo_impl.dart';
import 'package:route_it/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it/features/register/data/repo/register_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // getIt.registerSingleton<SharedPref>(SharedPref());
  getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<TechnologyCategoriesRepoImpl>(
      TechnologyCategoriesRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<TechnologyRepoImpl>(
    TechnologyRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<CacheServices>(CacheServices());
}
