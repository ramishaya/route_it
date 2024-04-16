import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/features/register/data/models/register_model.dart';
import 'package:route_it/features/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation}) async {
    try {
      var data = await apiService.post(endpoint: "register", data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passpasswordConfirmation
      });

      RegisterModel response = RegisterModel.fromJson(data);

      return (Right(response));
    } catch (e) {
      print("error in the Register : ");
      print(e.toString());
      if (e is DioException) {
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
