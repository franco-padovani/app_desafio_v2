import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/favourites/presentation/widgets/widgets.dart';

class SelectFavouritesDialog extends StatelessWidget {
  const SelectFavouritesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select your favourite characters',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumButtonText,
          ),
          SizedBox(
            height: 20,
          ),
          PersonalizedCard(),
        ],
      ),
    );
  }
}
