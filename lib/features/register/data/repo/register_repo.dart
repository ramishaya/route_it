import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/register/data/models/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation});
}
