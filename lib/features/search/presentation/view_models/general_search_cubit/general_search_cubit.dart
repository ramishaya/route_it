import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it/features/search/data/models/general_search_model.dart';
import 'package:route_it/features/search/data/repos/search_repo.dart';

part 'general_search_state.dart';

class GeneralSearchCubit extends Cubit<GeneralSearchState> {
  GeneralSearchCubit(this.searchRepo) : super(GeneralSearchInitial());
  final SearchRepo searchRepo;

  Future<void> generalSearch({required String name}) async {
    emit(GeneralSearchLoading());
    var response = await searchRepo.generalSearch(name: name);
    response.fold(
        (faliure) => emit(GeneralSearchFailure(errMessage: faliure.errMessage)),
        (success) => emit(GeneralSearchLoaded(generalSearchModel: success)));
  }
}
