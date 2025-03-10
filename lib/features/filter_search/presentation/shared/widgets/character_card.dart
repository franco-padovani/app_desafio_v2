import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              PersonalizedCircleAvatar(
                isAsset: false,
                image: character.image,
                imageRadius: 30,
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  _CharacterName(character: character),
                  _CharacterNumberOfAppearances(character: character),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterNumberOfAppearances extends StatelessWidget {
  const _CharacterNumberOfAppearances({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Text(
        'Appearances: ${character.episode.length}',
        style: AppTextStyles.defaultText,
      ),
    );
  }
}

class _CharacterName extends StatelessWidget {
  const _CharacterName({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Text(
        character.name,
        style: AppTextStyles.largeButtonText,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
