import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum UserRegisterStateStatus {
  initial,
  success,
  error,
}

@freezed
abstract class UserRegisterState with _$UserRegisterState {
  factory UserRegisterState({
    @Default(UserRegisterStateStatus.initial) UserRegisterStateStatus status,
    String? error,
  }) = _UserRegisterState;
}
