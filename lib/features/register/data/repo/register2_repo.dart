import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/register/data/models/register2_model.dart';

abstract class Register2Repo{
  Future<Either<Failure , Register2Model>> register2({
    required String email ,
    required String image,
    required String birthDate,
    required String itStudent,
    required String university,
    required String bio,});
}