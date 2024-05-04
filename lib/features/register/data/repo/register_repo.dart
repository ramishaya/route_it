import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/register/data/models/complete_register_model.dart';
import 'package:route_it/features/register/data/models/register_model.dart';
import 'package:route_it/features/register/data/models/verification_code.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation});

  Future<Either<Failure, VerificationCodeModel>> checkEmailVerificationCode(
      {required int verificationCode});

  Future<Either<Failure, CompleteRegisterModel>> completeRegister(
      {
      required String email,
      required File profileImage,
      required String birthDate,
      required String isItStudent,
      required String university,
      required String bio});
}
