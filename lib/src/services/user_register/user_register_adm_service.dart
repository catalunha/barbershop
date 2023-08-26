import 'package:barbershop/src/core/exceptions/service_exception.dart';

import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';

abstract interface class UserRegisterAdmService {
  Future<Either<ServiceException, Nil>> execute(
      ({String email, String name, String password}) userData);
}
