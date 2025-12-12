import 'package:bloc/bloc.dart';
import 'package:femitime_project/screens/menstrual_track/input_cycle/input_cycle_model.dart';
import 'package:femitime_project/screens/menstrual_track/input_cycle/input_cycle_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_cycle_event.dart';
part 'input_cycle_state.dart';
part 'input_cycle_bloc.freezed.dart';

class InputCycleBloc extends Bloc<InputCycleEvent, InputCycleState> {
  InputCycleBloc() : super(_Initial()) {
    on<InputCycleEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is _SaveInputCycle) {
        emit(const InputCycleState.loading());
        try {
          final response = await saveInputCycle(
            userId: event.userId,
            dayofperiod: event.dayofperiod,
            duration: event.duration,
            cycleLength: event.cycleLength,
            flowIntensity: event.flowIntensity,
            symptoms: event.symptoms,
            description: event.description,
          );
          emit(InputCycleState.success(response: response));
        } catch (e) {
          emit(InputCycleState.error(error: e.toString()));
        }
      }
    });
  }
}
