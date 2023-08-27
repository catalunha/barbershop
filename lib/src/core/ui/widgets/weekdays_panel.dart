import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/app_constants.dart';

class WeekdaysPanel extends StatelessWidget {
  final List<String>? enabledDays;
  final ValueChanged<String> onDayPressed;
  const WeekdaysPanel({
    Key? key,
    this.enabledDays,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os dias da semana',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonDay(
                label: 'Seg',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Ter',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Qua',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Qui',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Sex',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Sab',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
              ButtonDay(
                label: 'Dom',
                onDayPressed: onDayPressed,
                enabledDays: enabledDays,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonDay extends StatefulWidget {
  final List<String>? enabledDays;

  final String label;
  final ValueChanged<String> onDayPressed;
  const ButtonDay({
    Key? key,
    this.enabledDays,
    required this.label,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor =
        selected ? AppConstantColors.white : AppConstantColors.grey;
    var buttonColor =
        selected ? AppConstantColors.brow : AppConstantColors.white;
    final buttonBorderColor =
        selected ? AppConstantColors.brow : AppConstantColors.grey;
    // final ButtonDay(:enabledDays, :label) = widget;
    final disableDay = widget.enabledDays != null &&
        !widget.enabledDays!.contains(widget.label);
    if (disableDay) {
      buttonColor = Colors.grey[400]!;
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: disableDay
            ? null
            : () {
                widget.onDayPressed(widget.label);
                setState(() {
                  selected = !selected;
                });
              },
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: buttonColor,
            border: Border.all(
              color: buttonBorderColor,
            ),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                  fontSize: 12, color: textColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
