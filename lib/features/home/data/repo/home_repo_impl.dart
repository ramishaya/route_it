import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/models/technology_category_model.dart';
import 'package:route_it/features/home/data/repo/home_repo.dart';
import 'package:route_it/core/utils/cache_services.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl({
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

  @override
  Future<Either<Failure, List<TechnologiesModel>>> fetchTechnologies() async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologies",
          bearerToken: CacheServices.getData(key: "token"));

      List<TechnologiesModel> response = data
          .map((technology) => TechnologiesModel.fromJson(technology))
          .toList();
      print(response[1].description);
      return right(response);
    } catch (error) {
      print(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
