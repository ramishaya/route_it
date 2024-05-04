import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it/features/roadmaps/data/models/roadmap_skills_model.dart';

abstract class RoadMapRepo {
  Future<Either<Failure, List<RoadMapModel>>> fetchRoadMaps(
      {required int technologyLlevelId});

      Future<Either<Failure, List<RoadMapSkillsModel>>> fetchRoadMapSkills(
      {required int roadMapId});
}
