import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/funcional_program/either.dart';
import '../../../../core/funcional_program/nil.dart';
import 'states.dart';

part 'providers.g.dart';

@riverpod
class EmployeeRegisterController extends _$EmployeeRegisterController {
  @override
  EmployeeRegisterState build() {
    return EmployeeRegisterState();
  }

  void setRegisterAdm(bool isRegisterAdm) {
    state = state.copyWith(registerAdm: isRegisterAdm);
  }

  void workDaysUpdate(String value) {
    final workDays = [...state.workDays];
    if (workDays.contains(value)) {
      workDays.remove(value);
    } else {
      workDays.add(value);
    }
    state = state.copyWith(workDays: workDays);
  }

  void workHoursUpdate(int value) {
    // final EmployeeRegisterState(:workHours) = state;
    final workHours = [...state.workHours];
    if (workHours.contains(value)) {
      workHours.remove(value);
    } else {
      workHours.add(value);
    }
    state = state.copyWith(workHours: workHours);
  }

  Future<void> register({String? name, String? email, String? password}) async {
    final EmployeeRegisterState(:registerAdm, :workDays, :workHours) = state;
    final asyncLoaderHandler = AsyncLoaderHandler()..start();
    final UserRepository(:registerAdmAsEmployee, :registerEmployee) =
        ref.read(userRepositoryProvider);
    final Either<RepositoryException, Nil> resultRegister;
    if (registerAdm) {
      final dto = (
        workDays: workDays,
        workHours: workHours,
      );
      resultRegister = await registerAdmAsEmployee(dto);
    } else {
      final BarbershopModel(:id) =
          await ref.watch(getMyBarbershopProvider.future);
      final dto = (
        barbershopId: id,
        name: name!,
        email: email!,
        password: password!,
        workDays: workDays,
        workHours: workHours,
      );
      resultRegister = await registerEmployee(dto);
    }
    switch (resultRegister) {
      case Success():
        state = state.copyWith(status: EmployeeRegisterStateStatus.success);
      case Failure():
        state = state.copyWith(status: EmployeeRegisterStateStatus.error);
    }
    asyncLoaderHandler.close();
  }
}
