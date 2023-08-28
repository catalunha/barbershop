import 'dart:developer';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/funcional_program/nil.dart';
import 'package:barbershop/src/core/rest/rest_client.dart';
import 'package:barbershop/src/models/schedule_model.dart';
import 'package:dio/dio.dart';

import './schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final RestClient restClient;
  ScheduleRepositoryImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryException, Nil>> scheduleClient(
      ({
        int barbershopId,
        String clientName,
        DateTime date,
        int time,
        int userId
      }) dto) async {
    try {
      await restClient.auth.post('/schedules', data: {
        'barbershop_id': dto.barbershopId,
        'user_id': dto.userId,
        'client_name': dto.clientName,
        'date': dto.date.toIso8601String(),
        'time': dto.time,
      });
      return Success(Nil());
    } on DioException catch (e, s) {
      log('Error ScheduleRepositoryImpl.scheduleClient',
          error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao agendar horario'));
    }
  }

  @override
  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleByDate(
      ({DateTime date, int userId}) dto) async {
    try {
      final Response(:List data) = await restClient.auth.get('/schedules',
          queryParameters: {
            'user_id': dto.userId,
            'date': dto.date.toIso8601String()
          });
      final results = data.map((e) => ScheduleModel.fromJson(e)).toList();
      return Success(results);
    } on DioException catch (e, s) {
      log('Error ScheduleRepositoryImpl.findScheduleByDate DioException',
          error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar schedules'));
    } on ArgumentError catch (e, s) {
      log('Error ScheduleRepositoryImpl.findScheduleByDate ArgumentError',
          error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar schedules'));
    }
  }
}
