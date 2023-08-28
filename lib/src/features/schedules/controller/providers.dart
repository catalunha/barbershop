import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/features/schedules/controller/states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/barbershop_model.dart';
import '../../../models/user_model.dart';

part 'providers.g.dart';

@riverpod
class ScheduleController extends _$ScheduleController {
  @override
  ScheduleState build() {
    return ScheduleState();
  }

  void hourSelect(int hour) {
    if (hour == state.scheduleHour) {
      state = state.copyWith(scheduleHour: null);
    } else {
      state = state.copyWith(scheduleHour: hour);
    }
  }

  void dateSelected(DateTime date) {
    state = state.copyWith(scheduleDate: date);
  }

  Future<void> register(
      {required UserModel userModel, required String clientName}) async {
    final asyncLoaderHandler = AsyncLoaderHandler()..start();
    final ScheduleState(:scheduleHour, :scheduleDate) = state;
    final scheduleRepository = ref.read(scheduleRepositoryProvider);
    final BarbershopModel(id: barbershopId) =
        await ref.watch(getMyBarbershopProvider.future);
    final dto = (
      barbershopId: barbershopId,
      userId: userModel.id,
      clientName: clientName,
      date: scheduleDate!,
      time: scheduleHour!,
    );
    final scheduleResult = await scheduleRepository.scheduleClient(dto);
    switch (scheduleResult) {
      case Success():
        state = state.copyWith(status: ScheduleStateStatus.success);
      case Failure():
        state = state.copyWith(status: ScheduleStateStatus.error);
    }
    asyncLoaderHandler.close();
  }
}
