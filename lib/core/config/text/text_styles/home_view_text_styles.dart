import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';

import 'generic_text_styles.dart';

class HomeViewTextStyles extends AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.primaryRelevantText,
  );
  static const TextStyle attributeTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );
  static const TextStyle mainCharacters = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );

  // Card swiper
  static const TextStyle cardSwiperName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.white,
  );

  static const TextStyle cardSwiperStatus = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.blueTurquoise,
  );

  static const TextStyle cardSwiperAtributeTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle cardSwiperAtribute = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );
}
