import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/ui/widgets/app_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/app_theme.dart';
import 'features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const AppLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'BarberShop',
          theme: AppTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/home/adm': (_) => const Text('adm'),
            '/home/employee': (_) => const Text('employee'),
          },
        );
      },
    );
  }
}
