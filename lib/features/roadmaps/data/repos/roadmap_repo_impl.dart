import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/core/utils/dio/api_services.dart';
import 'package:route_it/core/utils/local_storage/cache_services.dart';
import 'package:route_it/features/roadmaps/data/models/article_sections_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/data/models/save_test_result.dart';
import 'package:route_it/features/roadmaps/data/models/skill_test_model.dart';
import 'package:route_it/features/roadmaps/data/models/skill_videos_model.dart';
import 'package:route_it/features/roadmaps/data/models/skills_articles_model.dart';
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

  @override
  Future<Either<Failure, SkillTestModel>> fetchSkillTest(
      {required int testId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getTestQuestions",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"roadmap_skill_id": testId});
      if (data["status"] == "success") {
        SkillTestModel response = SkillTestModel.fromJson(data);
        return Right(response);
      } else {
        throw (ServerFailure(data["status"]));
      }
    } catch (error) {
      // ignore: avoid_print
      print("error in Skill Test repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SaveTestResultModel>> saveTestResult(
      {required int testId, required bool isPassed}) async {
    try {
      var data = await apiService.post(
          endpoint: "saveTestResult",
          data: {"test_id": testId, "isPassed": isPassed},
          bearerToken: CacheServices.getData(key: "token"));
      SaveTestResultModel response = SaveTestResultModel.fromJson(data);
      return Right(response);
    } catch (error) {
      // ignore: avoid_print
      print("error in sAVE teST RESULT repository$error");
      if (error is DioException) {
        if (error.response!.statusCode == 422) {
          return Left(ServerFailure("User does not pass the test."));
        }
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SkillVideosModel>> fetchSkillVideos(
      {required int roadMapSkillId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getSkillVideos",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"roadmap_skill_id": roadMapSkillId});
      SkillVideosModel resposne = SkillVideosModel.fromJson(data);
      return Right(resposne);
    } catch (error) {
      // ignore: avoid_print
      print("error in  Skill Videos Repository  repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SkillsArticlesModel>> fetchSkillArticles(
      {required int roadMapSkillId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getSkillArticles",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"roadmap_skill_id": roadMapSkillId});

      SkillsArticlesModel response = SkillsArticlesModel.fromJson(data);

      return Right(response);
    } catch (error) {
      // ignore: avoid_print
      print("error in  Skill Articles  Repository  repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ArticleSectionsModel>> fetchArticleSections(
      {required int articleId}) async {
    try {
      var data = await apiService.get(
          endpoint: "getArticleSections",
          bearerToken: CacheServices.getData(key: "token"),
          queryParameters: {"article_id": articleId});

      ArticleSectionsModel response = ArticleSectionsModel.fromJson(data);

      return Right(response);
    } catch (error) {
      // ignore: avoid_print
      print("error in   Articles  Sections  Repository  repository$error");
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
