import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/config/images/images.dart';

class NothingFoundWidget extends StatelessWidget {
  const NothingFoundWidget({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ClipRRect(
              borderRadius: AppRadius.circularRectangularBorder,
              child: Image.asset(MyAssetImages.sorryAboutThatGif)),
          Text(
            message,
            style: AppTextStyles.errorText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
