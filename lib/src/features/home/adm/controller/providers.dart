import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/barbershop_model.dart';
import 'states.dart';

part 'providers.g.dart';

@riverpod
class HomeAdmController extends _$HomeAdmController {
  @override
  Future<HomeAdmState> build() async {
    final userRepository = ref.read(userRepositoryProvider);
    final BarbershopModel(id: barbershopId) =
        await ref.read(getMyBarbershopProvider.future);
    final result = await userRepository.getEmployees(barbershopId);
    // switch (result) {
    //   case Success(value: final employees):
    //     return HomeAdmState(
    //         status: HomeAdmStateStatus.loaded, employees: employees);
    //   case Failure():
    //     return HomeAdmState(status: HomeAdmStateStatus.loaded, employees: []);
    // }
    return switch (result) {
      Success(value: final employees) =>
        HomeAdmState(status: HomeAdmStateStatus.loaded, employees: employees),
      Failure() =>
        HomeAdmState(status: HomeAdmStateStatus.loaded, employees: []),
    };
  }

  Future<void> logout() async => ref.read(logoutProvider.future).asyncLoader();
}
