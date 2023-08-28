import 'dart:developer';

import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/core/ui/widgets/app_loader.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/employee/schedule/appointment_ds.dart';
import 'package:barbershop/src/features/employee/schedule/controller/providers.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'controller/states.dart';

class EmployeeSchedulePage extends ConsumerStatefulWidget {
  const EmployeeSchedulePage({super.key});

  @override
  ConsumerState<EmployeeSchedulePage> createState() =>
      _EmployeeSchedulePageState();
}

class _EmployeeSchedulePageState extends ConsumerState<EmployeeSchedulePage> {
  late DateTime dateSelected;
  var ignoreFirstLoad = true;
  @override
  void initState() {
    final DateTime(:year, :month, :day) = DateTime.now();
    dateSelected = DateTime(year, month, day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel(id: userId, :name) =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    final employeeSchedule =
        ref.watch(employeeScheduleControllerProvider(userId, dateSelected));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: AppConstantColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          employeeSchedule.when(
              loading: () => const AppLoader(),
              error: (Object error, StackTrace stackTrace) {
                log('Erro em carregar agenda',
                    error: error, stackTrace: stackTrace);
                AppMessages.showError('Erro em carregar agenda', context);
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              data: (EmployeeScheduleState data) {
                return Expanded(
                  child: SfCalendar(
                    allowViewNavigation: true,
                    view: CalendarView.day,
                    showNavigationArrow: true,
                    todayHighlightColor: AppConstantColors.brow,
                    showDatePickerButton: true,
                    showTodayButton: true,
                    dataSource: AppointmentDs(list: data.scheduleList),
                    onViewChanged: (viewChangedDetails) {
                      if (ignoreFirstLoad) {
                        ignoreFirstLoad = false;
                        return;
                      }

                      ref
                          .read(employeeScheduleControllerProvider(
                                  userId, dateSelected)
                              .notifier)
                          .changeDate(
                              userId, viewChangedDetails.visibleDates.first);
                    },
                    // appointmentBuilder: (context, calendarAppointmentDetails) {
                    //   return Container(
                    //     decoration: BoxDecoration(
                    //       color: AppConstantColors.brow,
                    //       shape: BoxShape.rectangle,
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         calendarAppointmentDetails
                    //             .appointments.first.subject,
                    //         style: const TextStyle(
                    //           color: AppConstantColors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // },
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
                );
              }),
          // Expanded(
          //   child: SfCalendar(
          //     allowViewNavigation: true,
          //     view: CalendarView.day,
          //     showNavigationArrow: true,
          //     todayHighlightColor: AppConstantColors.brow,
          //     showDatePickerButton: true,
          //     showTodayButton: true,
          //     dataSource: AppointmentDs(),
          //     appointmentBuilder: (context, calendarAppointmentDetails) {
          //       return Container(
          //         decoration: BoxDecoration(
          //           color: AppConstantColors.brow,
          //           shape: BoxShape.rectangle,
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         child: Center(
          //           child: Text(
          //             calendarAppointmentDetails.appointments.first.subject,
          //             style: const TextStyle(
          //               color: AppConstantColors.white,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //     onTap: (calendarTapDetails) {
          //       if (calendarTapDetails.appointments != null &&
          //           calendarTapDetails.appointments!.isNotEmpty) {
          //         showModalBottomSheet(
          //           context: context,
          //           builder: (context) {
          //             final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
          //             return SizedBox(
          //               height: 200,
          //               child: Center(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text(
          //                         'Client: ${calendarTapDetails.appointments?.first.subject}'),
          //                     Text(
          //                         'Hora: ${dateFormat.format(calendarTapDetails.date ?? DateTime.now())}'),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
