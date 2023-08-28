import 'dart:developer';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/funcional_program/either.dart';
import 'package:barbershop/src/core/funcional_program/nil.dart';
import 'package:barbershop/src/core/rest/rest_client.dart';
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
      await restClient.auth.post('/schedule', data: {
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
}
