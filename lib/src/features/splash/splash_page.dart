import 'dart:async';
import 'dart:developer';

import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/splash/controller/providers.dart';
import 'package:barbershop/src/features/splash/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimatedWidth => 100 * _scale;
  double get _logoAnimatedHeight => 120 * _scale;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
    super.initState();
  }

  var endAnimated = false;
  Timer? redirectTimer;
  void _redirect(String routeName) {
    if (!endAnimated) {
      print('_redirectTimer... ');

      redirectTimer?.cancel();
      redirectTimer = Timer(const Duration(milliseconds: 300), () {
        _redirect(routeName);
      });
    } else {
      redirectTimer?.cancel();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routeName, (route) => false);
      print('_redirect to $routeName... ');
    }
  }

  // void _redirect(String routeName) {
  //   Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  //   print('_redirect to $routeName... ');
  // }

  @override
  Widget build(BuildContext context) {
    print('SplashPage build... ');
    // if (endAnimated) {
    ref.listen(splashControllerProvider, (previous, next) {
      print('SplashController listen... ');
      next.whenOrNull(
        error: (error, stackTrace) {
          log('Erro no SplashPage.build()',
              error: error, stackTrace: stackTrace);
          AppMessages.showError('Erro ao validar login', context);
          _redirect('/auth/login');
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('/auth/login', (route) => false);
        },
        data: (data) {
          switch (data.status) {
            case SplashStateStatus.loggedAdm:
              _redirect('/home/adm');

            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/home/adm', (route) => false);
            case SplashStateStatus.loggedEmployee:
              _redirect('/home/employee');

            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/home/employee', (route) => false);
            case _:
              _redirect('/auth/login');

            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/auth/login', (route) => false);
          }
        },
      );
    });
    // }
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppConstantImages.backgroundChair,
            ),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              width: _logoAnimatedWidth,
              height: _logoAnimatedHeight,
              child: Image.asset(
                AppConstantImages.imageLogo,
                fit: BoxFit.cover,
              ),
            ),
            onEnd: () {
              print('Animated end... ');
              endAnimated = true;

              // setState(() {
              //   print('setState... ');
              //   endAnimated = true;
              // });
            },
          ),
        ),
      ),
    );
  }
}
