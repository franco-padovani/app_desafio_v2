import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';

import 'generic_text_styles.dart';

class CharacterScreenTextStyles extends AppTextStyles {
  static const TextStyle appBarTitleCharacterScreen = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );

  static const TextStyle atributeTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );

  static const TextStyle atributeResultStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );
}
