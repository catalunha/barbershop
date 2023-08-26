import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/barbershop_model.dart';
import '../../models/user_model.dart';
import '../../repositories/barbershop/barbershop_repository.dart';
import '../../repositories/barbershop/barbershop_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user_login/user_login_service.dart';
import '../../services/user_login/user_login_service_impl.dart';
import '../rest/rest_client.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) {
  return RestClient();
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(restClient: ref.read(restClientProvider));
}

@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) {
  return UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));
}

@Riverpod(keepAlive: true)
BarbershopRepository barbershopRepository(BarbershopRepositoryRef ref) {
  return BarbershopRepositoryImpl(restClient: ref.read(restClientProvider));
}

@Riverpod(keepAlive: true)
Future<UserModel> getMe(GetMeRef ref) async {
  final result = await ref.watch(userRepositoryProvider).me();
  return switch (result) {
    Success(value: final userModel) => userModel,
    Failure(:final exception) => throw exception
  };
}

@Riverpod(keepAlive: true)
Future<BarbershopModel> getMyBarbershop(GetMyBarbershopRef ref) async {
  final userModel = await ref.watch(getMeProvider.future);
  final barbershopRepository = ref.watch(barbershopRepositoryProvider);
  final result = await barbershopRepository.getMyBarbershop(userModel);
  return switch (result) {
    Success(value: final barbershop) => barbershop,
    Failure(:final exception) => throw exception
  };
}
