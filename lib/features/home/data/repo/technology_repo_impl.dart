import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/repo/technology_repo.dart';

class TechnologyRepoImpl implements TechnologyRepo {
  ApiService apiService;

  TechnologyRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<TechnologiesModel>>> fetchTechnologies() async {
    try {
      var data = await apiService.get(
          endpoint: "getTechnologies",
          bearerToken: CacheServices.getData(key: "token"));

      List<TechnologiesModel> response = data.map((technology) => TechnologiesModel.fromJson(technology)).toList();
      return right(response);
    } catch (error) {
      if(error is DioException){
        return Left(ServerFailure.fromDioError(error));
      }else{
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}