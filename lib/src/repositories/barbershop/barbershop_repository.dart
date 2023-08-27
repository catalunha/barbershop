import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/models/user_model.dart';

import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryException, Nil>> save(
      ({
        String nome,
        String email,
        List<String> openingDays,
        List<int> openingHours,
      }) data);
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(
      UserModel userModel);
}
