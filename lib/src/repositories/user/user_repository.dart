import 'package:barbershop/src/models/user_model.dart';

import '../../core/exceptions/auth_exception.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
  Future<Either<RepositoryException, UserModel>> me();
  Future<Either<RepositoryException, Nil>> registerAdmin(
      ({
        String name,
        String email,
        String password,
      }) userData);
}
