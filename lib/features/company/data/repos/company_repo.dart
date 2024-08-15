import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/company/data/models/company_profile_model.dart';

abstract class CompanyRepo {
  Future<Either<Failure, CompanyProfileModel>> fetchCompanyProfile(
      {required int companyId});
}
