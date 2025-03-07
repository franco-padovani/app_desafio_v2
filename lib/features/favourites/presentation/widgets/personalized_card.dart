import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/routes/routes.dart';

class PersonalizedCard extends StatelessWidget {
  const PersonalizedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 120,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.cardBackground.withAlpha(80),
          side: const BorderSide(
            color: AppColors.cardBorder,
            width: 5,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: AppRadius.circularRectangularBorder),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        onPressed: () => context.go(AppRoutes.search),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: AppColors.cardIcon,
              size: 50,
            ),
            Text(
              "Add",
              style: FavouriteScreenTextStyles.addFavouritesTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
