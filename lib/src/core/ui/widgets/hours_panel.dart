import 'package:flutter/material.dart';

import '../app_constants.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;
  const HoursPanel({
    Key? key,
    required this.startTime,
    required this.endTime,
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
              ButtonHour(label: '$i:00'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ButtonHour extends StatelessWidget {
  final String label;
  const ButtonHour({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 5),
      width: 64,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppConstantColors.white,
        border: Border.all(
          color: AppConstantColors.grey,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              color: AppConstantColors.grey,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
