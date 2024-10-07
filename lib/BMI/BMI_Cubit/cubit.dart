import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newfolder/BMI/BMI_Cubit/states.dart';

class BMiCubit extends Cubit<BMiStates> {
  BMiCubit() : super(BMiInitialState());

  static BMiCubit get(context) => BlocProvider.of(context);

  double weight = 0.0;
  int? age;


  void weightIncrement (){
    weight++;
    emit(BMiWeightIncrementState());
  }
  void weightDecrement (){
    if (weight >0){
      weight--;
      emit(BMiWeightDecrementState());
    }else (print('Can not go minus'));
  }
}