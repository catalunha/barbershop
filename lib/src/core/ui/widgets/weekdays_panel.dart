import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/app_constants.dart';

class WeekdaysPanel extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  const WeekdaysPanel({
    Key? key,
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
              ButtonDay(label: 'SEG', onDayPressed: onDayPressed),
              ButtonDay(label: 'TER', onDayPressed: onDayPressed),
              ButtonDay(label: 'QUA', onDayPressed: onDayPressed),
              ButtonDay(label: 'QUI', onDayPressed: onDayPressed),
              ButtonDay(label: 'SEX', onDayPressed: onDayPressed),
              ButtonDay(label: 'SAB', onDayPressed: onDayPressed),
              ButtonDay(label: 'DOM', onDayPressed: onDayPressed),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDayPressed;
  const ButtonDay({
    Key? key,
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
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
