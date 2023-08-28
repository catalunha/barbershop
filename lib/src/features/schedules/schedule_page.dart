import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/schedules/controller/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/widgets/avatar.dart';
import 'widgets/schedule_calendar.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  var showCalendar = false;
  final formKey = GlobalKey<FormState>();
  final clienteTEC = TextEditingController();
  final dateTEC = TextEditingController();
  var dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void dispose() {
    clienteTEC.dispose();
    dateTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheduleController = ref.watch(scheduleControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: Center(
                child: Column(
              children: [
                const Avatar(hideUpload: true),
                const Text(
                  'Nome e Sobrenome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: clienteTEC,
                  validator: Validatorless.required('Campo obrigatorio'),
                  decoration: const InputDecoration(
                    label: Text('Cliente'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onTap: () {
                    setState(() {
                      showCalendar = true;
                    });
                    FocusScope.of(context).unfocus();
                  },
                  controller: dateTEC,
                  readOnly: true,
                  validator: Validatorless.required('Campo obrigatorio'),
                  decoration: const InputDecoration(
                    label: Text('Selecione uma data'),
                    hintText: 'Selecione uma data',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                ),
                Offstage(
                  offstage: !showCalendar,
                  child: ScheduleCalendar(
                    onPressed: (DateTime value) {
                      setState(() {
                        dateTEC.text = dateFormat.format(value);
                        scheduleController.dateSelected(value);
                        showCalendar = false;
                      });
                    },
                    cancelPressed: () {
                      setState(() {
                        showCalendar = false;
                      });
                    },
                  ),
                ),
                HoursPanel.singleSelection(
                  startTime: 6,
                  endTime: 23,
                  onPressed: (p0) {
                    scheduleController.hourSelect(p0);
                  },
                  enabledHours: const [6, 7, 8],
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (formKey.currentState?.validate()) {
                      case null || false:
                        AppMessages.showError('Dados imcompletos', context);
                      case true:
                        final hourSelected = ref.watch(
                            scheduleControllerProvider
                                .select((state) => state.scheduleHour != null));

                        if (hourSelected) {
                        } else {
                          AppMessages.showError('Selecione a hora', context);
                        }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56)),
                  child: const Text('AGENDAR'),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
