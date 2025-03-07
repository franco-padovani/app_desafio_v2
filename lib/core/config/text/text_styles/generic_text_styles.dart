import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:app_desafio_v2/core/config/text/text_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.orbitron,
    color: AppColors.textColor,
  );

  static const TextStyle subTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle largeButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle mediumButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle smallButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle normalText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: "Orbitron",
    color: AppColors.textColor,
  );

  static const TextStyle defaultText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static const TextStyle errorText = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      letterSpacing: 1,
      overflow: TextOverflow.visible);
}
