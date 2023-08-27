import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum BarbershopRegisterStateStatus {
  initial,
  error,
  success,
}

@freezed
abstract class BarbershopRegisterState with _$BarbershopRegisterState {
  factory BarbershopRegisterState({
    @Default(BarbershopRegisterStateStatus.initial)
    BarbershopRegisterStateStatus status,
    String? error,
    @Default([]) List<String> openingDays,
    @Default([]) List<int> openingHours,
  }) = _BarbershopRegisterState;
}
