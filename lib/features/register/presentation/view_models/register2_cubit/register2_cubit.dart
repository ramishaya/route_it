import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it/features/register/data/models/register2_model.dart';
import 'package:route_it/features/register/data/repo/register2_repo.dart';

part 'register2_state.dart';

class Register2Cubit extends Cubit<Register2State> {
  Register2Cubit(this.register2repo) : super(Register2Initial());

  static Register2Cubit get(context) => BlocProvider.of(context);

  final Register2Repo register2repo;

  Future<void> completeRegister(
      {required String email,
      required String image,
      required String birthDate,
      required bool itStudent,
      required String university,
      required String bio}) async {
    emit(Register2Loading());
    var response = await register2repo.register2(
        email: email,
        image: image,
        birthDate: birthDate,
        itStudent: itStudent,
        university: university,
        bio: bio);

    response.fold(
        (failure) => emit(Register2Failure(errorMessage: failure.errMessage)),
        (success) => Register2Success(register2model: success));
  }
}