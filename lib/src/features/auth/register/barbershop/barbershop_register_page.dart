import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/hours_panel.dart';
import '../../../../core/ui/widgets/weekdays_panel.dart';

class BarbershopRegisterPage extends StatelessWidget {
  const BarbershopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar barbershop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(label: Text('Nome')),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(label: Text('email')),
              ),
              const SizedBox(height: 20),
              const WeekdaysPanel(),
              const SizedBox(height: 20),
              const HoursPanel(
                startTime: 6,
                endTime: 23,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56)),
                onPressed: () {},
                child: const Text('Cadastrar Barbershop'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
