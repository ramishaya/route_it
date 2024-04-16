import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:route_it/features/register/data/models/register_model.dart';
import 'package:route_it/features/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final RegisterRepo registerRepo;

  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation}) async {
    emit(RegisterLoading());
    var finalResponse = await registerRepo.register(
        name: name,
        email: email,
        password: password,
        passpasswordConfirmation: passpasswordConfirmation);

    finalResponse.fold(
        (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
        (success) => emit(RegisterSucces(response: success)));
  }
}
