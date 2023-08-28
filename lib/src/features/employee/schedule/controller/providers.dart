import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/funcional_program/either.dart';
import 'states.dart';

part 'providers.g.dart';

@riverpod
class EmployeeScheduleController extends _$EmployeeScheduleController {
  @override
  Future<EmployeeScheduleState> build(int userId, DateTime date) async {
    // final scheduleRepository = ref.read(scheduleRepositoryProvider);
    // final scheduleListEither = await scheduleRepository
    //     .findScheduleByDate((userId: userId, date: date));
    final scheduleListEither = await _getSchedules(userId, date);
    return switch (scheduleListEither) {
      Success() => EmployeeScheduleState(),
      Failure(:final exception) => throw Exception(exception),
      // Success(value: final list) => state = state.copyWith(scheduleList: list),
      // Failure(:exception) => state = state.copyWith(scheduleList: list),
    };
  }

  Future<Either<RepositoryException, EmployeeScheduleState>> _getSchedules(
      int userId, DateTime date) async {
    final scheduleRepository = ref.read(scheduleRepositoryProvider);
    final scheduleListEither = await scheduleRepository
        .findScheduleByDate((userId: userId, date: date));
    return switch (scheduleListEither) {
      Success(value: final list) =>
        Success(EmployeeScheduleState(scheduleList: list)),
      Failure(exception: final exception) => Failure(exception),
    };
  }

  Future<void> changeDate(int userId, DateTime date) async {
    final scheduleListEither = await _getSchedules(userId, date);
    state = switch (scheduleListEither) {
      Success(value: final stateNew) => AsyncData(stateNew),
      Failure(:final exception) =>
        AsyncError(Exception(exception), StackTrace.current),
    };
  }
}
