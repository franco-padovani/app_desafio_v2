import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';

import 'generic_text_styles.dart';

class SearchScreenTextStyles extends AppTextStyles {
  static const TextStyle smallFilledButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );

  static const TextStyle smallButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: "Orbitron",
    color: AppColors.secondaryButton,
  );
}
