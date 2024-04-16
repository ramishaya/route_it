import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/login/data/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login( {required String email ,  required String password});
}
