import 'package:barbershop/src/core/providers/app_providers.dart';
import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:barbershop/src/core/ui/widgets/app_loader.dart';
import 'package:barbershop/src/core/ui/widgets/avatar.dart';
import 'package:barbershop/src/core/ui/widgets/messages.dart';
import 'package:barbershop/src/features/home/employee/controller/providers.dart';
import 'package:barbershop/src/features/home/widgets/home_header_widget.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeEmployeePage extends ConsumerWidget {
  const HomeEmployeePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModelAsync = ref.watch(getMeProvider);
    return Scaffold(
      body: userModelAsync.when(
        data: (data) {
          final UserModel(:name, :id) = data;
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeHeaderWidget(
                  showFilter: false,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Avatar(hideUpload: true),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .7,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppConstantColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final totalAsync =
                                  ref.watch(getTotalSchedulesProvider(id));
                              return totalAsync.when(
                                data: (data) {
                                  return Text(
                                    '$data',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      color: AppConstantColors.brow,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                                error: (error, stackTrace) {
                                  return const Text('Erro');
                                },
                                loading: () {
                                  return const AppLoader();
                                },
                              );
                            },
                          ),
                          const Text(
                            'Hoje',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppConstantColors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await Navigator.of(context)
                              .pushNamed('/schedule', arguments: data);
                          ref.invalidate(getTotalSchedulesProvider);
                        },
                        child: const Text('Agendar Cliente')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/employee/schedule', arguments: data);
                        },
                        child: const Text('Ver Cliente')),
                  ],
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          AppMessages.showError('Erro ao carregar dados', context);
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loading: () {
          return const AppLoader();
        },
      ),
    );
  }
}
