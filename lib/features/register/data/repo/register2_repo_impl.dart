import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/features/register/data/models/register2_model.dart';
import 'package:route_it/features/register/data/repo/register2_repo.dart';

class Register2RepoImpl implements Register2Repo {
  final ApiService apiService;

  Register2RepoImpl(this.apiService);

  @override
  Future<Either<Failure, Register2Model>> register2(
      {required String email,
      required String image,
      required String birthDate,
      required bool itStudent,
      required String university,
      required String bio}) async {
    try {
      var data = await apiService.post(endpoint: "completeRegister", data: {
        "email": email,
        "image": image,
        "birth_date" : birthDate,
        "it_student" : itStudent,
        "university" : university,
        "bio" : bio
      });

      Register2Model response = Register2Model.fromJson(data);
      return(Right(response));

    } catch (error) {
      if(error is DioException){
        return(Left(ServerFailure.fromDioError(error)));
      }else{
        return(Left(ServerFailure(error.toString())));
      }
    }
  }
}
