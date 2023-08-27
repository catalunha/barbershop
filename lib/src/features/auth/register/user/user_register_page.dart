import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import 'controller/providers.dart';
import 'controller/states.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {
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
    // final userRegisterController = ref.watch(userRegisterControllerProvider);
    ref.listen(
      userRegisterControllerProvider,
      (previous, next) {
        switch (next.status) {
          case UserRegisterStateStatus.initial:
            break;
          case UserRegisterStateStatus.success:
            Navigator.of(context).pushNamed('/auth/register/barbershop');
          case UserRegisterStateStatus.error:
            AppMessages.showError(
                'Erro ao registrar usuario administrador', context);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: nomeTEC,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: Validatorless.required('Campo obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailTEC,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório'),
                    Validatorless.email('Nao é email'),
                  ]),
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: senhaTEC,
                  obscureText: true,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: Validatorless.required('Campo obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório'),
                    Validatorless.compare(senhaTEC, 'Valores diferentes')
                  ]),
                  decoration: const InputDecoration(
                    label: Text('Confirmar Senha'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56)),
                  onPressed: () {
                    switch (formKey.currentState?.validate()) {
                      case null || false:
                        AppMessages.showError('Formulario inválido', context);
                      case true:
                        ref
                            .read(userRegisterControllerProvider.notifier)
                            .register(
                                nome: nomeTEC.text,
                                email: emailTEC.text,
                                senha: senhaTEC.text);
                    }
                  },
                  child: const Text('Criar conta'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
