import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:flutter/material.dart';

class HomeEmployeeTile extends StatelessWidget {
  const HomeEmployeeTile({super.key});
  final bool imageNetWork = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 150,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppConstantColors.grey,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: switch (imageNetWork) {
                true => const NetworkImage('url'),
                false => const AssetImage(AppConstantImages.avatar),
              } as ImageProvider),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'nome e sobrenome',
                  style: TextStyle(
                    color: AppConstantColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('AGENDAR'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('VER AGENDA'),
                    ),
                    const Icon(
                      Icons.edit,
                      size: 16,
                      color: AppConstantColors.brow,
                    ),
                    const Icon(
                      Icons.delete,
                      size: 16,
                      color: AppConstantColors.red,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
