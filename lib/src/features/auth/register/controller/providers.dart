import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/services/user_register/user_register_adm_service.dart';
import 'package:barbershop/src/services/user_register/user_register_adm_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'states.dart';

part 'providers.g.dart';

@riverpod
UserRegisterAdmService userRegisterAdmService(UserRegisterAdmServiceRef ref) {
  return UserRegisterAdmServiceImpl(
    userRepository: ref.watch(userRepositoryProvider),
    userLoginService: ref.watch(userLoginServiceProvider),
  );
}

@riverpod
class UserRegisterController extends _$UserRegisterController {
  @override
  UserRegisterState build() {
    return UserRegisterState();
  }

  Future<void> register(
      {required String nome,
      required String email,
      required String senha}) async {
    final userRegisterAdmService = ref.watch(userRegisterAdmServiceProvider);
    final userData = (name: nome, email: email, password: senha);
    final userRegisterAdmServiceExecute =
        await userRegisterAdmService.execute(userData).asyncLoader();
    switch (userRegisterAdmServiceExecute) {
      case Success():
        ref.invalidate(getMeProvider);
        state = state.copyWith(status: UserRegisterStateStatus.success);
      case Failure():
        state = state.copyWith(status: UserRegisterStateStatus.error);
    }
  }
}
