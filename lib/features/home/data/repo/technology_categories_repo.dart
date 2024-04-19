import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/home/data/models/technology_categories_model.dart';

abstract class TechnologyCategoriesRepo {
  Future<Either<Failure, List<TechnologyCategoryModel>>> fetchAllCategories();
}
