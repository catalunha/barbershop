import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';

class ScheduleCalendar extends StatefulWidget {
  final VoidCallback cancelPressed;
  final ValueChanged<DateTime> onPressed;
  final List<String> workDays;
  const ScheduleCalendar({
    Key? key,
    required this.cancelPressed,
    required this.onPressed,
    required this.workDays,
  }) : super(key: key);

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime? selectedDay;
  late final List<int> weekDaysEnable;
  int convertWeekDay(String weekDay) {
    return switch (weekDay.toLowerCase()) {
      'seg' => DateTime.monday,
      'ter' => DateTime.thursday,
      'qua' => DateTime.wednesday,
      'qui' => DateTime.thursday,
      'sex' => DateTime.friday,
      'sab' => DateTime.saturday,
      'dom' => DateTime.sunday,
      _ => DateTime.monday,
    };
  }

  @override
  void initState() {
    weekDaysEnable = widget.workDays.map(convertWeekDay).toList();
    // weekDaysEnable = widget.workDays.map((e) => convertWeekDay(e)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppConstantColors.greyLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        TableCalendar(
          availableGestures: AvailableGestures.none,
          headerStyle: const HeaderStyle(titleCentered: true),
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2023, 01, 01),
          lastDay: DateTime.now().add(const Duration(days: 10)),
          calendarFormat: CalendarFormat.month,
          locale: 'pt_BR',
          enabledDayPredicate: (day) {
            return weekDaysEnable.contains(day.weekday);
          },
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
          },
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
            });
          },
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: AppConstantColors.brow,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: AppConstantColors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: widget.cancelPressed,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 14,
                  color: AppConstantColors.brow,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (selectedDay == null) {
                    AppMessages.showError('Informe um dia', context);
                    return;
                  }
                  widget.onPressed(selectedDay!);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppConstantColors.brow,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        )
      ]),
    );
  }
}
