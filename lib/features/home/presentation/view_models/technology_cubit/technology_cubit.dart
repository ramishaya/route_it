import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/repo/home_repo.dart';

part 'technology_state.dart';

class TechnologyCubit extends Cubit<TechnologyState> {
  TechnologyCubit({required this.homeRepo}) : super(TechnologyInitial());

  HomeRepo homeRepo;

  Future<void> fetchAllTechologies() async {
    var response = await homeRepo.fetchTechnologies();

    response.fold(
      (failure) {
        emit(TechnologyFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(TechnologySuccess(technologiesModel: success));
      },
    );
  }
}
