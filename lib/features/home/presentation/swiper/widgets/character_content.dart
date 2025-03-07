import 'package:flutter/widgets.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class CharacterContent extends StatelessWidget {
  const CharacterContent({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CharacterStatus(character: character),
        _SwiperText(
          atributeTitle: 'Species: ',
          atributeValue: character.species,
        ),
        _SwiperText(
          atributeTitle: 'Gender: ',
          atributeValue: character.gender,
        ),
        _SwiperText(
          atributeTitle: 'Origin: ',
          atributeValue: character.origin.name,
        ),
      ],
    );
  }
}

class _CharacterStatus extends StatelessWidget {
  const _CharacterStatus({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      character.status,
      style: HomeViewTextStyles.cardSwiperStatus,
      overflow: TextOverflow.visible,
    );
  }
}

class _SwiperText extends StatelessWidget {
  final String atributeTitle;
  final String atributeValue;
  const _SwiperText({
    required this.atributeTitle,
    required this.atributeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: atributeTitle,
            style: HomeViewTextStyles.cardSwiperAtributeTitle,
          ),
          TextSpan(
            text: atributeValue,
            style: HomeViewTextStyles.cardSwiperAtribute,
          ),
        ],
      ),
    );
  }
}
