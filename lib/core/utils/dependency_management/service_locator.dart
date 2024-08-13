import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_it/core/utils/dio/api_services.dart';
import 'package:route_it/core/utils/local_storage/cache_services.dart';
import 'package:route_it/features/home/data/repo/home_repo_impl.dart';
import 'package:route_it/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it/features/register/data/repo/register_repo_impl.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<CacheServices>(CacheServices());

  getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(apiService: getIt.get<ApiService>()));

  

  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));

      
  getIt.registerSingleton<RoadMapRepoImpl>(
      RoadMapRepoImpl(apiService: getIt.get<ApiService>()));

}
