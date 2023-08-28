import 'dart:developer';

import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/features/splash/controller/states.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<SplashState> build() async {
    print('SplashController build... ');
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey(AppLocalStorageKeys.accessToken)) {
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyBarbershopProvider);
      try {
        final userModel = await ref.watch(getMeProvider.future);
        return switch (userModel) {
          UserModelAdm() => SplashState(status: SplashStateStatus.loggedAdm),
          UserModelEmployee() =>
            SplashState(status: SplashStateStatus.loggedEmployee)
        };
      } catch (e, s) {
        log('Erro no SplashController.build() ', error: e, stackTrace: s);
        return SplashState(status: SplashStateStatus.login);
      }
    }
    return SplashState(status: SplashStateStatus.login);
  }
}
