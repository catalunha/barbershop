import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/service_exception.dart';

import 'package:barbershop/src/core/funcional_program/either.dart';

import 'package:barbershop/src/core/funcional_program/nil.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/local_storage_keys.dart';
import './user_login_service.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});
  @override
  Future<Either<ServiceException, Nil>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);
    switch (loginResult) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(AppLocalStorageKeys.accessToken, accessToken);
        return Success(Nil());
      case Failure(:final exception):
        return switch (exception) {
          ErrorAuthException() =>
            Failure(ServiceException(message: 'Erro ao realizar login')),
          UnAuthorizedAuthException() =>
            Failure(ServiceException(message: 'Login ou senha inválidos')),
        };
    }
  }
}
