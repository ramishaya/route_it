import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';
import 'package:route_it/features/login/data/repos/login_repo_impl.dart';
import 'package:route_it/features/register/data/repo/register_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<SharedPref>(SharedPref());
  getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(apiService: getIt.get<ApiService>()));
}
