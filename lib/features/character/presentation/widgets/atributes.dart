import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/character/presentation/widgets/flip_card_container.dart';

class Atributes extends StatelessWidget {
  final Character character;
  const Atributes({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          _AtributeTile(
            atributeTitle: 'Species',
            atributeResult: character.species,
          ),
          _AtributeTile(
            atributeTitle: 'Type',
            atributeResult: character.type,
          ),
          _AtributeTile(
            atributeTitle: 'Gender',
            atributeResult: character.gender,
          ),
          _AtributeTile(
            atributeTitle: 'Origin',
            atributeResult: character.origin.name,
          ),
          _AtributeTile(
            atributeTitle: 'Last seen',
            atributeResult: character.location.name,
          ),
          SizedBox(
            height: 21,
          )
        ],
      ),
    );
  }
}

class _AtributeTile extends StatelessWidget {
  _AtributeTile({
    required this.atributeTitle,
    required this.atributeResult,
  });
  final String atributeTitle;
  final String atributeResult;

  final _gestureFlipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlipCard(
          rotateSide: RotateSide.bottom,
          onTapFlipping: true,
          axis: FlipAxis.vertical,
          controller: _gestureFlipCardController,
          frontWidget: FlipCardContainer(
            borderColor: AppColors.primaryButton,
            text: atributeTitle,
            textStyle: CharacterScreenTextStyles.atributeTitleStyle,
          ),
          backWidget: FlipCardContainer(
            borderColor: AppColors.primaryButton,
            text: atributeResult.toUpperCase(),
            textStyle: CharacterScreenTextStyles.atributeResultStyle,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
