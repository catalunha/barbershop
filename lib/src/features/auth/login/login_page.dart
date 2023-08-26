import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/features/auth/login/controller/providers.dart';
import 'package:barbershop/src/features/auth/login/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/messages.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  @override
  void dispose() {
    emailTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginControllerProvider,
      (previous, next) {
        switch (next) {
          case LoginState(status: LoginStateStatus.initial):
            break;
          case LoginState(status: LoginStateStatus.error, :final error?):
            AppMessages.showError(error, context);
          case LoginState(status: LoginStateStatus.error):
            AppMessages.showError('Erro ao realizar login', context);
          case LoginState(status: LoginStateStatus.admLogin):
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/adm', (route) => false);
            break;
          case LoginState(status: LoginStateStatus.employeeLogin):
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/employee', (route) => false);
            break;
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background_image_chair.jpg',
              ),
              opacity: 0.2,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/imgLogo.png'),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: emailTEC,
                            onTapOutside: (_) =>
                                FocusScope.of(context).unfocus(),
                            validator: Validatorless.multiple([
                              Validatorless.required('Informação obrigatória'),
                              Validatorless.email('Não é email'),
                            ]),
                            decoration: const InputDecoration(
                              label: Text('Email'),
                              hintText: 'E-mail',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle:
                                  TextStyle(color: AppConstantColors.black),
                              hintStyle:
                                  TextStyle(color: AppConstantColors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passwordTEC,
                            onTapOutside: (_) =>
                                FocusScope.of(context).unfocus(),
                            validator: Validatorless.multiple([
                              Validatorless.required('Informação obrigatória'),
                            ]),
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              hintText: 'Senha',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle:
                                  TextStyle(color: AppConstantColors.black),
                              hintStyle:
                                  TextStyle(color: AppConstantColors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Esqueceu a senha ?',
                              style: TextStyle(color: AppConstantColors.brow),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              switch (formKey.currentState?.validate()) {
                                case (false || null):
                                  AppMessages.showError(
                                      'Campos inválidos', context);
                                case true:
                                  ref
                                      .read(loginControllerProvider.notifier)
                                      .login(emailTEC.text, passwordTEC.text);
                              }
                              // final isValid =
                              //     formKey.currentState?.validate() ?? false;
                              // if (isValid) {
                              //   //
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(56)),
                            child: const Text('ACESSAR'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/auth/register/user');
                              },
                              child: const Text(
                                'Criar conta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // const Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Text(
                      //     'Criar conta',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
