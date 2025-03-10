import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:app_desafio_v2/core/config/images/images.dart';
import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class PersonalizedProgressIndicator extends StatelessWidget {
  const PersonalizedProgressIndicator({
    super.key,
    required this.progressIndicator,
    required this.progressPercent,
  });

  final double progressIndicator;
  final int progressPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        _LoadingWidget(progressIndicator: progressIndicator),
        const SizedBox(
          height: 30,
        ),
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 10.0,
          percent: progressIndicator,
          center: Text('${progressPercent.toString()}%'),
          progressColor: AppColors.glowGreen,
        ),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({required this.progressIndicator});

  final double progressIndicator;

  @override
  Widget build(BuildContext context) {
    String image = MyAssetImages.elementalRings;
    String text = 'Cargando personajes... Relájate, Morty.';

    if (progressIndicator > 0.75) {
      text = 'Prepareate para el caos interdimensional...';
      image = MyAssetImages.rickMorty;
    } else if (progressIndicator > 0.5) {
      text = '¡Vamos! Hasta Jerry es más rápido.';
      image = MyAssetImages.mostWanted;
    } else if (progressIndicator > 0.25) {
      text = 'Ya casi... como un portal a medio abrir.';
      image = MyAssetImages.resort;
    }

    return Column(
      children: [
        PersonalizedCircleAvatar(isAsset: true, image: image, imageRadius: 120),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: Text(
            text,
            style: AppTextStyles.defaultText,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
