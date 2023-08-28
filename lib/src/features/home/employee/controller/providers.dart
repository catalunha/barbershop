import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Future<int> getTotalSchedules(GetTotalSchedulesRef ref, int userId) async {
  final DateTime(:year, :month, :day) = DateTime.now();
  final filter = (
    date: DateTime(year, month, day),
    userId: userId,
  );
  final scheduleRepository = ref.read(scheduleRepositoryProvider);
  final list = await scheduleRepository.findScheduleByDate(filter);
  return switch (list) {
    Success(value: List(length: final total)) => total,
    Failure(:final exception) => throw exception
  };
}
