// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/features/login/data/models/login_model.dart';
import 'package:route_it/features/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;
  LoginRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endpoint: "login", data: {"email": email, "password": password});

      LoginModel response = LoginModel.fromJson(data);
      // CacheServices.saveData(key: "token", value: response.success!.token);

      return (Right(response));
    } catch (e) {
      // print("we have error " + e.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
