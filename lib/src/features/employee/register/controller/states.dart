import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum EmployeeRegisterStateStatus {
  initial,
  success,
  error,
}

@freezed
abstract class EmployeeRegisterState with _$EmployeeRegisterState {
  factory EmployeeRegisterState({
    @Default(EmployeeRegisterStateStatus.initial)
    EmployeeRegisterStateStatus status,
    String? error,
    @Default(false) bool registerAdm,
    @Default([]) List<String> workDays,
    @Default([]) List<int> workHours,
  }) = _EmployeeRegisterState;
}
