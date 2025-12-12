import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:femitime_project/patient_screen/pcod_prediction/input_condition_datas.dart/input_condition_model.dart';
import 'package:femitime_project/patient_screen/pcod_prediction/input_condition_datas.dart/input_condition_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_condition_event.dart';
part 'input_condition_state.dart';
part 'input_condition_bloc.freezed.dart';

class InputConditionBloc
    extends Bloc<InputConditionEvent, InputConditionState> {
  InputConditionBloc() : super(_Initial()) {
    on<InputConditionEvent>((event, emit) async {
      

    
      if (event is _PcodInputDetails) {
        emit(const InputConditionState.loading());
        try {
          final response = await inputHealthProfile(
  userId: event.userId,
  age: event.age,
  weight: event.weight,
  height: event.height,
  bmi: event.bmi,
  fastFoodConsumption: event.fastFoodConsumption,
  bloodGroup: event.bloodGroup,
  pulseRate: event.pulseRate,
  cycleRegularity: event.cycleRegularity,
  hairGrowth: event.hairGrowth,
  acne: event.acne,
  moodSwings: event.moodSwings,
  skinDarkening: event.skinDarkening,
  pdfFile: event.pdfFile,       // NEW
);

          emit(InputConditionState.success(response: response));
        } catch (e) {
          emit(InputConditionState.error(error: e.toString()));
          print('error:${e.toString()}');
        }
      }
    });
  }
}
