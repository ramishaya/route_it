import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it/core/utils/assets_data.dart';
import 'package:route_it/features/register/data/models/register2_model.dart';
import 'package:route_it/features/register/data/repo/register2_repo.dart';

part 'register2_state.dart';

class Register2Cubit extends Cubit<Register2State> {
  Register2Cubit({required this.register2repo}) : super(Register2Initial());

  static Register2Cubit get(context) => BlocProvider.of(context);

  final Register2Repo register2repo;

  Future<void> completeRegister(
      {required String email,
      String image = AssetsData.profileImg,
      required String birthDate,
      required String itStudent,
      required String university,
      String bio = ""}) async {
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
        (success) => emit(Register2Success(register2model: success))
    );
  }
}
