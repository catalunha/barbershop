import 'package:barbershop/src/core/exceptions/repository_exception.dart';

import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';
import '../../models/schedule_model.dart';

abstract interface class ScheduleRepository {
  Future<Either<RepositoryException, Nil>> scheduleClient(
      ({
        int barbershopId,
        int userId,
        String clientName,
        DateTime date,
        int time
      }) dto);
  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleByDate(
      ({DateTime date, int userId}) dto);
}
