import 'package:barbershop/src/models/user_model.dart';

import '../../core/exceptions/auth_exception.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(
    String email,
    String password,
  );
  Future<Either<RepositoryException, UserModel>> me();
  Future<Either<RepositoryException, Nil>> registerAdmin(
      ({
        String name,
        String email,
        String password,
      }) userData);
  Future<Either<RepositoryException, List<UserModel>>> getEmployees(
      int barbershopId);
  Future<Either<RepositoryException, Nil>> registerAdmAsEmployee(
      ({
        List<String> workDays,
        List<int> workHours,
      }) dto);
  Future<Either<RepositoryException, Nil>> registerEmployee(
      ({
        int barbershopId,
        String name,
        String email,
        String password,
        List<String> workDays,
        List<int> workHours,
      }) dto);
}
