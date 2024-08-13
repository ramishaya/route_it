import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/roadmaps/data/models/article_sections_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it/features/roadmaps/data/models/save_test_result.dart';
import 'package:route_it/features/roadmaps/data/models/skill_test_model.dart';
import 'package:route_it/features/roadmaps/data/models/skill_videos_model.dart';
import 'package:route_it/features/roadmaps/data/models/skills_articles_model.dart';

abstract class RoadMapRepo {
  Future<Either<Failure, List<RoadMapModel>>> fetchRoadMaps(
      {required int technologyLlevelId});

  Future<Either<Failure, List<RoadMapSkillsModel>>> fetchRoadMapSkills(
      {required int roadMapId});

  Future<Either<Failure, SkillVideosModel>> fetchSkillVideos({
    required int roadMapSkillId,
  });

  Future<Either<Failure, SkillsArticlesModel>> fetchSkillArticles({
    required int roadMapSkillId,
  });
    Future<Either<Failure,ArticleSectionsModel>> fetchArticleSections({
    required int articleId,
  });

  //! here we should change the test id to skill id after the bakcend is done woth tye API's
  Future<Either<Failure, SkillTestModel>> fetchSkillTest({required int testId});

  Future<Either<Failure, SaveTestResultModel>> saveTestResult(
      {required int testId, required bool isPassed});
}
