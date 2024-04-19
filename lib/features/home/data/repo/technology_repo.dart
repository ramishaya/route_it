import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';

abstract class TechnologyRepo{
  Future<Either<Failure, List<TechnologiesModel>>> fetchTechnologies();
}