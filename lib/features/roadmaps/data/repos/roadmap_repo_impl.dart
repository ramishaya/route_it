import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/api_services.dart';
import 'package:route_it/core/utils/cache_services.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo.dart';

class RoadMapRepoImpl implements RoadMapRepo {
  final ApiService apiService;

  RoadMapRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<RoadMapModel>>> fetchRoadMaps(
      {required int technologyLlevelId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getRoadmaps",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"technology_level_id": technologyLlevelId});
      if (data["message"] == "Success") {
        List<dynamic> finalData = data["roadmaps"];
        List<RoadMapModel> response =
            finalData.map((roadmap) => RoadMapModel.fromJson(roadmap)).toList();

        return right(response);
      } else {
        throw (ServerFailure(data["message"]));
      }
    } catch (error) {
      // ignore: avoid_print
      print("error in raodMaps repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<RoadMapSkillsModel>>> fetchRoadMapSkills(
      {required int roadMapId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getRoadmapSkills",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"roadmap_id": roadMapId});
      if (data["message"] == "Success") {
        List<dynamic> finalData = data["skills"];
        List<RoadMapSkillsModel> response = finalData
            .map((roadmapSkill) => RoadMapSkillsModel.fromJson(roadmapSkill))
            .toList();

        return right(response);
      } else {
        throw (ServerFailure(data["message"]));
      }
    } catch (error) {
      // ignore: avoid_print
      print("error in raodMapsSkills repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
