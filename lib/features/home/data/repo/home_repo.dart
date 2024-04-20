import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/home/data/models/technology_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TechnologyCategoryModel>>> fetchAllCategories();
}
