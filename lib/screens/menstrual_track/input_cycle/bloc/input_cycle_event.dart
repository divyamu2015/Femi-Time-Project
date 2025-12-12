part of 'input_cycle_bloc.dart';

@freezed
class InputCycleEvent with _$InputCycleEvent {
  const factory InputCycleEvent.started() = _Started;
  const factory InputCycleEvent.saveInputCycle({

    required int userId,
    required String dayofperiod,
    required int duration,
    required int cycleLength,
    required String flowIntensity,
    required String symptoms,
    required String description,
  }) = _SaveInputCycle;
  
}