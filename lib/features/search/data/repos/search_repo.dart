import 'package:dartz/dartz.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/search/data/models/general_search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, GeneralSearchModel>> generalSearch({required String name});
}
