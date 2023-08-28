import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/schedule_model.dart';

part 'states.freezed.dart';

enum EmployeeScheduleStateStatus {
  initial,
  success,
  error,
}

@freezed
abstract class EmployeeScheduleState with _$EmployeeScheduleState {
  factory EmployeeScheduleState({
    @Default(EmployeeScheduleStateStatus.initial)
    EmployeeScheduleStateStatus status,
    String? error,
    @Default([]) List<ScheduleModel> scheduleList,
  }) = _EmployeeScheduleState;
}
