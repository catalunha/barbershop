import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/app_constants.dart';

class WeekdaysPanel extends StatelessWidget {
  const WeekdaysPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione os dias da semana',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonDay(label: 'SEG'),
              ButtonDay(label: 'TER'),
              ButtonDay(label: 'QUA'),
              ButtonDay(label: 'QUI'),
              ButtonDay(label: 'SEX'),
              ButtonDay(label: 'SAB'),
              ButtonDay(label: 'DOM'),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonDay extends StatelessWidget {
  final String label;
  const ButtonDay({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Container(
          width: 40,
          height: 56,
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
        ),
      ),
    );
  }
}
