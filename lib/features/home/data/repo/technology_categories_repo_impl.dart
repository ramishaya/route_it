import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/cache_services.dart';
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
          bearerToken: CacheServices.getData(key: "token"));
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
