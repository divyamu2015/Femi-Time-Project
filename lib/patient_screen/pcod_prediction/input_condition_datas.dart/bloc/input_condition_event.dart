part of 'input_condition_bloc.dart';

@freezed
class InputConditionEvent with _$InputConditionEvent {
  const factory InputConditionEvent.started() = _Started;
  const factory InputConditionEvent.pcodInputDetails({
  required int userId,
  required int age,
  required double weight,
  required double height,
  required double bmi,
  required int fastFoodConsumption,
  required String bloodGroup,
  required double pulseRate,
  required int cycleRegularity,
  required int hairGrowth,
  required int acne,
  required int moodSwings,
  required int skinDarkening,
  required File pdfFile,       // ADD THIS
}) = _PcodInputDetails;

  
}