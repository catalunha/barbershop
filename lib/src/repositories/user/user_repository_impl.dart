import 'dart:developer';
import 'dart:io';

import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';

import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/rest/rest_client.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:dio/dio.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({
    required this.restClient,
  });
  @override
  Future<Either<AuthException, String>> login(
      String email, String password) async {
    try {
      final Response(:data) = await restClient.unauth.post(
        '/auth',
        data: {
          "email": email,
          "password": password,
        },
      );
      return Success(data['access_token']);
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.login', name: 'Error', error: e, stackTrace: s);
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          return Failure(UnAuthorizedAuthException());
        }
      }
      return Failure(ErrorAuthException(message: 'Erro ao realizar login'));
    }
  }

  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final Response(:data) = await restClient.auth.get('/me');
      return Success(UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.me DioException',
          name: 'Error', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao buscar dados de usuario'));
    } on ArgumentError catch (e, s) {
      log('UserRepositoryImpl.me ArgumentError',
          name: 'Error', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message));
    }
  }
}
