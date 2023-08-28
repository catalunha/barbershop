import 'dart:developer';

import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/core/ui/widgets/app_loader.dart';
import 'package:barbershop/src/features/home/adm/controller/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/home_header_widget.dart';
import 'controller/states.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends ConsumerWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAdmController = ref.watch(homeAdmControllerProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/employee/register');
          ref.invalidate(getMeProvider);
          ref.invalidate(homeAdmControllerProvider);
        },
        backgroundColor: AppConstantColors.brow,
        child: const Icon(Icons.add),
      ),
      body: homeAdmController.when(
        data: (HomeAdmState data) {
          print('data.employees.length');
          print(data.employees.length);
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeHeaderWidget(
                  showFilter: false,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: data.employees.length,
                  (context, index) =>
                      HomeEmployeeTile(employee: data.employees[index]),
                ),
              )
            ],
          );
        },
        error: (Object error, StackTrace stackTrace) {
          log('HomeAdmPage build.',
              name: 'Error', error: error, stackTrace: stackTrace);
          return const Center(
            child: Text('Erro ao carregar página'),
          );
        },
        loading: () {
          return const AppLoader();
        },
      ),
    );
  }
}
