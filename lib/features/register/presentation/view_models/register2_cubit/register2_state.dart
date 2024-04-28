part of 'register2_cubit.dart';

@immutable
class Register2State extends Equatable{
  const Register2State();
  @override
  List<Object?> get props => [];
}

class Register2Initial extends Register2State {}

class Register2Loading extends Register2State {}

class Register2Success extends Register2State {
 final Register2Model register2model;

 const Register2Success({required this.register2model});
}

class Register2Failure extends Register2State {
  final String errorMessage;

  const Register2Failure({required this.errorMessage});
}
