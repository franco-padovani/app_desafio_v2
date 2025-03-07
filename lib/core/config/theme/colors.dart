import 'package:flutter/material.dart';

class AppColors {
  // Paleta de colores
  static const Color white = Color(0XFFFFFFFF);
  static const Color lightYellow = Color(0XFFFFFFBE);
  static const Color lightLightYellow = Color(0XFFFFFFBF);
  static const Color glowGreen = Color(0XFF5BCF79);
  static const Color blueTurquoise = Color(0XFF02AFCA);
  static const Color darkBlue = Color(0XFF1E40AF);
  static const Color strongBlue = Color(0XFF5C76FF);
  static const Color lightBlue = Color(0XFFE3EAFD);
  static const Color darkGrey = Color(0XFF191919);
  static const Color black = Color(0XFF000000);

  static const Color primaryBackground = white;
  static const Color primaryBackgroundElevation =
      Color.fromARGB(255, 242, 242, 242);
  static const Color secondaryBackground = lightYellow;

  static const Color primaryRelevantText = glowGreen;
  static const Color secondaryRelevantText = blueTurquoise;

  static const Color primaryButton = glowGreen;
  static const Color secondaryButton = blueTurquoise;

  static const Color textColor = black;

  // Status color
  static const Color aliveColor = Color(0XFF8BC34A);
  static const Color deadColor = Color(0XFFEF5350);
  static const Color unknownColor = Color(0XFFBDBDBD);

  // Card color
  static const Color cardBorder = lightBlue;
  static const Color cardBackground = Color.from(
    alpha: 0.8,
    red: 0.361,
    green: 0.463,
    blue: 1,
  );
  static const Color cardIcon = darkBlue;
}

class AppGradients {
  static LinearGradient lightGreenToBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryRelevantText,
      AppColors.secondaryRelevantText,
    ],
  );
}
