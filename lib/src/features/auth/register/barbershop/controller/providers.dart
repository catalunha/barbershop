import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/features/auth/register/barbershop/controller/states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class BarbershopRegisterController extends _$BarbershopRegisterController {
  @override
  BarbershopRegisterState build() {
    return BarbershopRegisterState();
  }

  void openingDayUpdate(String value) {
    var openingDays = [...state.openingDays];
    if (openingDays.contains(value)) {
      openingDays.remove(value);
    } else {
      openingDays.add(value);
    }
    state = state.copyWith(openingDays: openingDays);
  }

  void openingHoursUpdate(int value) {
    var openingHours = [...state.openingHours];
    if (openingHours.contains(value)) {
      openingHours.remove(value);
    } else {
      openingHours.add(value);
    }
    state = state.copyWith(openingHours: openingHours);
  }

  Future<void> register(String nome, String email) async {
    final repo = ref.watch(barbershopRepositoryProvider);
    final dto = (
      nome: nome,
      email: email,
      openingDays: state.openingDays,
      openingHours: state.openingHours,
    );
    final result = await repo.save(dto);
    switch (result) {
      case Success():
        ref.invalidate(getMyBarbershopProvider);
        state = state.copyWith(status: BarbershopRegisterStateStatus.success);
      case Failure():
        state = state.copyWith(status: BarbershopRegisterStateStatus.error);
    }
  }
}
