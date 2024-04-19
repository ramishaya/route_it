part of 'register2_cubit.dart';

@immutable
class Register2State extends Equatable{
  @override

  List<Object?> get props => throw UnimplementedError();
}

class Register2Initial extends Register2State {}

class Register2Loading extends Register2State {}

class Register2Success extends Register2State {
 final Register2Model register2model;

 Register2Success({required this.register2model});
}

class Register2Failure extends Register2State {
 final String errorMessage;

  Register2Failure({required this.errorMessage});
}
