import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it/features/home/data/models/technology_categories_model.dart';
import 'package:route_it/features/home/data/repo/technology_categories_repo.dart';

part 'technology_categories_state.dart';

class TechnologyCategoriesCubit extends Cubit<TechnologyCategoriesState> {
  TechnologyCategoriesCubit({required this.technologyCategoriesRepo})
      : super(TechnologyCategoriesInitial());

  TechnologyCategoriesRepo technologyCategoriesRepo;

  Future<void> fetchAllCategories() async {
    var response = await technologyCategoriesRepo.fetchAllCategories();

    response.fold(
        (failure) =>
            emit(TechnologyCategoriesFailure(errMessage: failure.errMessage)),
        (success) =>
            emit(TechnologyCategoriesLoaded(technologyCategories: success)));
  }
}
