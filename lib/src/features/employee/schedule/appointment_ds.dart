import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/ui/app_constants.dart';
import '../../../models/schedule_model.dart';

class AppointmentDs extends CalendarDataSource {
  final List<ScheduleModel> list;
  AppointmentDs({
    required this.list,
  });
  @override
  // TODO: implement appointments
  List<dynamic>? get appointments => list.map(
        (e) {
          final ScheduleModel(
            date: DateTime(:year, :month, :day),
            :hour,
            :clientName
          ) = e;

          return Appointment(
            startTime: DateTime(year, month, day, hour),
            endTime: DateTime(year, month, day, hour + 1),
            subject: clientName,
            color: AppConstantColors.brow,
          );
        },
      ).toList();

  // @override
  // // TODO: implement appointments
  // List<dynamic>? get appointments => [
  //       Appointment(
  //         startTime: DateTime.now(),
  //         endTime: DateTime.now().add(
  //           const Duration(hours: 1),
  //         ),
  //         subject: 'Pessoa 1',
  //         color: AppConstantColors.brow,
  //       ),
  //       Appointment(
  //         startTime: DateTime.now().add(
  //           const Duration(hours: 2),
  //         ),
  //         endTime: DateTime.now().add(
  //           const Duration(hours: 3),
  //         ),
  //         subject: 'Pessoa 2',
  //         color: AppConstantColors.brow,
  //       ),
  //     ];
}
