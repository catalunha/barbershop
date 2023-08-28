import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum ScheduleStateStatus {
  initial,
  success,
  error,
}

@freezed
abstract class ScheduleState with _$ScheduleState {
  factory ScheduleState({
    @Default(ScheduleStateStatus.initial) ScheduleStateStatus status,
    String? error,
    int? scheduleHour,
    DateTime? scheduleDate,
  }) = _ScheduleState;
}
