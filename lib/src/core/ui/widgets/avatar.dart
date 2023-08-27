import 'package:barbershop/src/core/ui/app_constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppConstantImages.avatar,
              ),
            ),
          ),
        ),
        Positioned(
          // top: 5,
          bottom: 5,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
                color: AppConstantColors.white,
                border: Border.all(
                  color: AppConstantColors.brow,
                  width: 5,
                ),
                shape: BoxShape.circle),
            child: const Icon(
              Icons.add,
              color: AppConstantColors.red,
            ),
          ),
        )
      ],
    );
  }
}
