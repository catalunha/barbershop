import 'package:barbershop/src/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum HomeAdmStateStatus {
  initial,
  loaded,
  error,
}

@freezed
abstract class HomeAdmState with _$HomeAdmState {
  factory HomeAdmState({
    @Default(HomeAdmStateStatus.initial) HomeAdmStateStatus status,
    String? error,
    @Default([]) List<UserModel> employees,
  }) = _HomeAdmState;
}
