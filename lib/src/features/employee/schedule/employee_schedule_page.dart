import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/features/employee/schedule/appointment_ds.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeeSchedulePage extends StatelessWidget {
  const EmployeeSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Column(
        children: [
          const Text(
            'nome e sobrenome',
            style: TextStyle(
              fontSize: 20,
              color: AppConstantColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SfCalendar(
              allowViewNavigation: true,
              view: CalendarView.day,
              showNavigationArrow: true,
              todayHighlightColor: AppConstantColors.brow,
              showDatePickerButton: true,
              showTodayButton: true,
              dataSource: AppointmentDs(),
              appointmentBuilder: (context, calendarAppointmentDetails) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppConstantColors.brow,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      calendarAppointmentDetails.appointments.first.subject,
                      style: const TextStyle(
                        color: AppConstantColors.white,
                      ),
                    ),
                  ),
                );
              },
              onTap: (calendarTapDetails) {
                if (calendarTapDetails.appointments != null &&
                    calendarTapDetails.appointments!.isNotEmpty) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Client: ${calendarTapDetails.appointments?.first.subject}'),
                              Text(
                                  'Hora: ${dateFormat.format(calendarTapDetails.date ?? DateTime.now())}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
