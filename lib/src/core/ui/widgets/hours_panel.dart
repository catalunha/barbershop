import 'package:flutter/material.dart';

import '../app_constants.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;
  final Function(int) onPressed;
  const HoursPanel({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            for (int i = startTime; i <= endTime; i++)
              ButtonHour(
                label: '$i:00',
                value: i,
                onPressed: onPressed,
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ButtonHour extends StatefulWidget {
  final String label;
  final int value;
  final Function(int) onPressed;
  const ButtonHour({
    Key? key,
    required this.label,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonHour> createState() => _ButtonHourState();
}

class _ButtonHourState extends State<ButtonHour> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor =
        selected ? AppConstantColors.white : AppConstantColors.grey;
    var buttonColor =
        selected ? AppConstantColors.brow : AppConstantColors.white;
    final buttonBorderColor =
        selected ? AppConstantColors.brow : AppConstantColors.grey;
    return InkWell(
      onTap: () {
        widget.onPressed(widget.value);
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 5),
        width: 64,
        height: 36,
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
    );
  }
}
