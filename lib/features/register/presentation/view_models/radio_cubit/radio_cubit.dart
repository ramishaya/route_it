import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  static RadioCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

  void changeRadioIndex(int index){
    currentIndex = index;
    emit(ChangeRadioIndex());
  }
  int getCurrentIndex(){
    return currentIndex ;
  }
}
