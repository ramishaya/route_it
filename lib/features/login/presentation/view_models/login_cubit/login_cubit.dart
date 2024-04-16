import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:route_it/features/login/data/repos/login_repo.dart';

import '../../../data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var finalResponse = await loginRepo.login(email: email, password: password);

    finalResponse.fold((failure) => emit(LoginFailure(failure.errMessage)),
        (success) => emit(LoginSuccess(success)));
  }
}
