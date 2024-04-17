// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/features/home/data/models/technology_categories_model.dart';
import 'package:route_it/features/home/data/repo/technology_categories_repo.dart';

class TechnologyCategoriesRepoImpl implements TechnologyCategoriesRepo {
  ApiService apiService;
  TechnologyCategoriesRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, List<TechnologyCategoryModel>>>
      fetchAllCategories() async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologyCategories",
          bearerToken: "35|yZi1daPSsdMifXPLmjL1sgGDYvkaymTXljnEtwsh2f929ef4");
      List<TechnologyCategoryModel> response = data
          .map((category) => TechnologyCategoryModel.fromJson(category))
          .toList();

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
