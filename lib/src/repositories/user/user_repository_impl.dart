import 'dart:developer';
import 'dart:io';

import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';

import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/funcional_program/nil.dart';
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

  @override
  Future<Either<RepositoryException, Nil>> registerAdmin(
      ({String email, String name, String password}) userData) async {
    try {
      await restClient.unauth.post('/users', data: {
        'name': userData.name,
        'email': userData.email,
        'password': userData.password,
        'profile': 'ADM',
      });
      return Success(Nil());
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.registerAdmin DioException',
          name: 'Error', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao registrar admin'));
    }
  }

  @override
  Future<Either<RepositoryException, List<UserModel>>> getEmployees(
      int barbershopId) async {
    try {
      final Response(:List data) = await restClient.auth
          .get('/users', queryParameters: {'barbershop_id': barbershopId});
      final employees = data.map((e) => UserModelEmployee.fromMap(e)).toList();
      return Success(employees);
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.getEmployees DioException',
          name: 'Error', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao buscar colaborador'));
    } on ArgumentError catch (e, s) {
      log('UserRepositoryImpl.getEmployees ArgumentError',
          name: 'Error', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message));
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> registerAdmAsEmployee(
      ({List<String> workDays, List<int> workHours}) dto) async {
    try {
      final userModelResult = await me();
      // final UserModel userModel;
      // switch (userModelResult) {
      //   case Success(value: final user):
      //     userModel = user;
      //   case Failure(:var exception):
      //     return Failure(exception);
      // }
      //     await restClient.auth.put('/users/${userModel.id}', data: {
      //   'work_days': dto.workDays,
      //   'work_hours': dto.workHours,
      // });
      final int userId;
      switch (userModelResult) {
        case Success(value: UserModel(:final id)):
          userId = id;
        case Failure(:var exception):
          return Failure(exception);
      }
      await restClient.auth.put('/users/$userId', data: {
        'work_days': dto.workDays,
        'work_hours': dto.workHours,
      });
      return Success(Nil());
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.registerAdmAsEmployee DioException',
          name: 'Error', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao registerAdmAsEmployee'));
    }
    // on ArgumentError catch (e, s) {
    //   log('UserRepositoryImpl.registerAdmAsEmployee ArgumentError',
    //       name: 'Error', error: e, stackTrace: s);
    //   return Failure(RepositoryException(message: e.message));
    // }
  }

  @override
  Future<Either<RepositoryException, Nil>> registerEmployee(
      ({
        int barbershopId,
        String name,
        String email,
        String password,
        List<String> workDays,
        List<int> workHours,
      }) dto) async {
    try {
      await restClient.auth.post('/users/', data: {
        'name': dto.name,
        'email': dto.email,
        'password': dto.password,
        'barbershop_id': dto.barbershopId,
        'profile': 'EMPLOYEE',
        'work_days': dto.workDays,
        'work_hours': dto.workHours,
      });
      return Success(Nil());
    } on DioException catch (e, s) {
      log('UserRepositoryImpl.registerAdmAsEmployee DioException',
          name: 'Error', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao registerAdmAsEmployee'));
    }
  }
}
