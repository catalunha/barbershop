import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/home_header_widget.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends StatelessWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppConstantColors.brow,
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeaderWidget(
              showFilter: false,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => const HomeEmployeeTile(),
            ),
          )
        ],
      ),
    );
  }
}
