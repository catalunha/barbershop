import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/auth/register/barbershop/controller/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/widgets/hours_panel.dart';
import '../../../../core/ui/widgets/weekdays_panel.dart';
import 'controller/states.dart';

class BarbershopRegisterPage extends ConsumerStatefulWidget {
  const BarbershopRegisterPage({super.key});

  @override
  ConsumerState<BarbershopRegisterPage> createState() =>
      _BarbershopRegisterPageState();
}

class _BarbershopRegisterPageState
    extends ConsumerState<BarbershopRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nomeTEC = TextEditingController();
  final emailTEC = TextEditingController();

  @override
  void dispose() {
    nomeTEC.dispose();
    emailTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbershopRegisterController =
        ref.watch(barbershopRegisterControllerProvider.notifier);
    ref.listen(barbershopRegisterControllerProvider, (previous, next) {
      switch (next.status) {
        case BarbershopRegisterStateStatus.initial:
          break;
        case BarbershopRegisterStateStatus.success:
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/adm', (route) => false);
        case BarbershopRegisterStateStatus.error:
          AppMessages.showError(
              'Não foi possivel registrar a barbearia', context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar barbershop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: nomeTEC,
                  validator: Validatorless.required('Campos obrigatório'),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(label: Text('Nome')),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailTEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Campos obrigatório'),
                    Validatorless.email('Nao é email'),
                  ]),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(label: Text('email')),
                ),
                const SizedBox(height: 20),
                WeekdaysPanel(
                  onDayPressed: (value) {
                    // ref
                    //     .read(barbershopRegisterControllerProvider.notifier)
                    //     .openingDayUpdate(value);
                    barbershopRegisterController.openingDayUpdate(value);
                  },
                ),
                const SizedBox(height: 20),
                HoursPanel(
                  startTime: 6,
                  endTime: 23,
                  onPressed: (p0) {
                    // ref
                    //     .read(barbershopRegisterControllerProvider.notifier)
                    //     .openingHoursUpdate(p0);
                    barbershopRegisterController.openingHoursUpdate(p0);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56)),
                  onPressed: () {
                    switch (formKey.currentState?.validate()) {
                      case false || null:
                        AppMessages.showError('Formulario inválido', context);
                      case true:
                        ref
                            .read(barbershopRegisterControllerProvider.notifier)
                            .register(nomeTEC.text, emailTEC.text);
                    }
                  },
                  child: const Text('Cadastrar Barbershop'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
