import 'dart:developer';

import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/core/ui/widgets/app_loader.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/employee/register/controller/providers.dart';
import 'package:barbershop/src/features/employee/register/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/avatar.dart';
import '../../../core/ui/widgets/hours_panel.dart';
import '../../../core/ui/widgets/weekdays_panel.dart';
import '../../../models/barbershop_model.dart';

class EmployeeRegisterPage extends ConsumerStatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  ConsumerState<EmployeeRegisterPage> createState() =>
      _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends ConsumerState<EmployeeRegisterPage> {
  var registerAdm = false;
  final formKey = GlobalKey<FormState>();
  final nomeTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final senhaTEC = TextEditingController();
  @override
  void dispose() {
    nomeTEC.dispose();
    emailTEC.dispose();
    senhaTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final employeeRegisterController =
    //     ref.watch(employeeRegisterControllerProvider.notifier);
    ref.listen(
        employeeRegisterControllerProvider.select((state) => state.status),
        (previous, next) {
      switch (next) {
        case EmployeeRegisterStateStatus.initial:
          break;
        case EmployeeRegisterStateStatus.success:
          AppMessages.showSuccess(
              'Colaborador cadastrado com sucesso', context);
          Navigator.of(context).pop();
        case EmployeeRegisterStateStatus.error:
          AppMessages.showError('Erro ao registrar colaborador', context);
      }
    });
    final getMyBarbershop = ref.watch(getMyBarbershopProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar colaborador'),
      ),
      body: getMyBarbershop.when(data: (BarbershopModel data) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Avatar(),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Checkbox.adaptive(
                          value: registerAdm,
                          onChanged: (value) {
                            setState(() {
                              registerAdm = !registerAdm;

                              ref
                                  .read(employeeRegisterControllerProvider
                                      .notifier)
                                  .setRegisterAdm(registerAdm);
                            });
                          }),
                      const Flexible(
                          child: Text(
                        'Sou adm e quero me cadastrar como colaborador',
                      ))
                    ],
                  ),
                  Offstage(
                    offstage: registerAdm,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nomeTEC,
                            validator: registerAdm
                                ? null
                                : Validatorless.required('Campo obrigatório'),
                            decoration: const InputDecoration(
                              label: Text(
                                'Nome',
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: emailTEC,
                            validator: registerAdm
                                ? null
                                : Validatorless.multiple([
                                    Validatorless.required('Campo obrigatório'),
                                    Validatorless.email('Nao é email'),
                                  ]),
                            decoration: const InputDecoration(
                              label: Text(
                                'E-mail',
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: senhaTEC,
                            obscureText: true,
                            validator: registerAdm
                                ? null
                                : Validatorless.required('Campo obrigatório'),
                            decoration: const InputDecoration(
                              label: Text(
                                'Senha',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      //dia 4 parte 2 min57.11
                      WeekdaysPanel(
                        enabledDays: data.openingDays,
                        // enabledDays: const ['Seg', 'Sex'],
                        onDayPressed: ref
                            .read(employeeRegisterControllerProvider.notifier)
                            .workDaysUpdate,
                        // onDayPressed: (value) {},
                      ),
                      HoursPanel(
                        enabledHours: data.openingHours,
                        // enabledHours: const [6, 10],
                        startTime: 6,
                        endTime: 23,
                        onPressed: ref
                            .read(employeeRegisterControllerProvider.notifier)
                            .workHoursUpdate,
                        // onPressed: (p0) {},
                      ),
                      ElevatedButton(
                        onPressed: () {
                          switch (formKey.currentState?.validate()) {
                            case false || null:
                              AppMessages.showError(
                                  'Faltam campos obrigatorios', context);
                            case true:
                              final EmployeeRegisterState(
                                workDays: List(isNotEmpty: hasWorkDays),
                                workHours: List(isNotEmpty: hasWorkHours),
                                // :workDays,
                                // :workHours,
                              ) = ref.watch(employeeRegisterControllerProvider);
                              if (!hasWorkDays || !hasWorkHours) {
                                // if (workDays.isEmpty || workHours.isEmpty) {
                                AppMessages.showError(
                                    'Preencha dia e horarios', context);
                                return;
                              } else {
                                ref
                                    .read(employeeRegisterControllerProvider
                                        .notifier)
                                    .register(
                                      name: nomeTEC.text,
                                      email: emailTEC.text,
                                      password: senhaTEC.text,
                                    );
                              }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56)),
                        child: const Text('Cadastrar colaborador'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }, error: (Object error, StackTrace stackTrace) {
        log('Erro em EmployeeRegisterPage build',
            error: error, stackTrace: stackTrace);
        AppMessages.showError('Erro ao carregar página', context);
        return const Center(
          child: Text('Erro ao carregar a página'),
        );
      }, loading: () {
        return const AppLoader();
      }),
    );
  }
}
