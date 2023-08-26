import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/rest/rest_client.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:dio/dio.dart';

import './barbershop_repository.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final RestClient restClient;
  BarbershopRepositoryImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelAdm():
        final Response(data: List(first: data)) = await restClient.auth.get(
          '/barbershop',
          queryParameters: {
            'user_id': '#userAuthRef',
          },
        );
        return Success(BarbershopModel.fromJson(data));
      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/barbershop/${userModel.barbershopId}',
        );
        return Success(BarbershopModel.fromJson(data));
    }
  }
}
