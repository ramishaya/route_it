import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:route_it/core/errors/failures.dart';
import 'package:route_it/features/home/data/models/technologies_model.dart';
import 'package:route_it/features/home/data/repo/technology_repo.dart';

part 'technology_state.dart';

class TechnologyCubit extends Cubit<TechnologyState> {
  TechnologyCubit({required this.technologyRepo}) : super(TechnologyInitial());

  TechnologyRepo technologyRepo;

  Future<void> fetchAllTechologies() async {
    var response = await technologyRepo.fetchTechnologies();

    response.fold(
            (failure) {
              emit(TechnologyFailure(errMessage: failure.errMessage));
            },
            (success) {
              emit(TechnologySuccess(technologiesModel:success));
            },
    );
  }
}
