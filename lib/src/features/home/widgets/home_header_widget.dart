import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final bool showFilter;
  const HomeHeaderWidget({super.key, this.showFilter = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.sizeOf(context).width,
      // height: 400,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: AppConstantColors.black,
        image: DecorationImage(
          image: AssetImage(AppConstantImages.backgroundChair),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppConstantColors.greyLight,
                child: SizedBox.shrink(),
              ),
              const SizedBox(width: 16),
              const Flexible(
                child: Text(
                  'Andrea Andrea Andrea Andrea Andrea ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppConstantColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Editar',
                style: TextStyle(
                  color: AppConstantColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.abc,
                    color: AppConstantColors.brow,
                  ))
            ],
          ),
          const SizedBox(width: 16),
          const Text(
            'Bem vindo',
            style: TextStyle(
              color: AppConstantColors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Agenda um cliente',
            style: TextStyle(
              color: AppConstantColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Offstage(
            offstage: !showFilter,
            child: TextFormField(
              decoration: const InputDecoration(
                  label: Text('Buscar colaborador'),
                  suffixIcon: Icon(Icons.search)),
            ),
          )
        ],
      ),
    );
  }
}
