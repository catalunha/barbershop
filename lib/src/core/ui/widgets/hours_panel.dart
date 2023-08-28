import 'package:flutter/material.dart';

import '../app_constants.dart';

class HoursPanel extends StatefulWidget {
  final List<int>? enabledHours;

  final int startTime;
  final int endTime;
  final Function(int) onPressed;
  final bool singleSelection;
  const HoursPanel({
    super.key,
    this.enabledHours,
    required this.startTime,
    required this.endTime,
    required this.onPressed,
  }) : singleSelection = false;
  const HoursPanel.singleSelection({
    super.key,
    this.enabledHours,
    required this.startTime,
    required this.endTime,
    required this.onPressed,
  }) : singleSelection = true;

  @override
  State<HoursPanel> createState() => _HoursPanelState();
}

class _HoursPanelState extends State<HoursPanel> {
  int? lastSelection;
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
            for (int i = widget.startTime; i <= widget.endTime; i++)
              ButtonHour(
                  label: '$i:00',
                  value: i,
                  enabledHours: widget.enabledHours,
                  timeSelected: lastSelection,
                  singleSelection: widget.singleSelection,
                  onPressed: (value) {
                    setState(() {
                      if (widget.singleSelection) {
                        if (lastSelection == value) {
                          lastSelection = null;
                        } else {
                          lastSelection = value;
                        }
                      }
                    });
                    widget.onPressed(value);
                  }
                  // onPressed: widget.onPressed,
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
  final List<int>? enabledHours;
  final String label;
  final int value;
  final Function(int) onPressed;
  final bool singleSelection;
  final int? timeSelected;
  const ButtonHour({
    Key? key,
    this.enabledHours,
    required this.label,
    required this.value,
    required this.onPressed,
    required this.singleSelection,
    this.timeSelected,
  }) : super(key: key);

  @override
  State<ButtonHour> createState() => _ButtonHourState();
}

class _ButtonHourState extends State<ButtonHour> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.singleSelection) {
      if (widget.timeSelected != null) {
        if (widget.timeSelected == widget.value) {
          selected = true;
        } else {
          selected = false;
        }
      }
    }
    final textColor =
        selected ? AppConstantColors.white : AppConstantColors.grey;
    var buttonColor =
        selected ? AppConstantColors.brow : AppConstantColors.white;
    final buttonBorderColor =
        selected ? AppConstantColors.brow : AppConstantColors.grey;
    final disableHour = widget.enabledHours != null &&
        !widget.enabledHours!.contains(widget.value);
    if (disableHour) {
      buttonColor = Colors.grey[400]!;
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: disableHour
            ? null
            : () {
                widget.onPressed(widget.value);
                setState(() {
                  selected = !selected;
                });
              },
        child: Container(
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
      ),
    );
  }
}
