import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';

class FlipCardContainer extends StatelessWidget {
  const FlipCardContainer({
    super.key,
    required this.borderColor,
    required this.text,
    required this.textStyle,
  });

  final Color borderColor;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: AppRadius.circularBorder,
        boxShadow: AppShadows.cardContainerShadow,
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
