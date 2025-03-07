import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/character/presentation/view/character_view.dart';
import 'package:app_desafio_v2/features/home/presentation/swiper/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class CardSwiper extends StatelessWidget {
  final Character character;
  const CardSwiper({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharacterView(character: character),
        ),
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppShadows.cardContainerShadow),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _MainCharactersName(
                character: character,
              ),
              _CharacterAtributes(character: character),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterAtributes extends StatelessWidget {
  const _CharacterAtributes({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 170,
          child: CharacterContent(
            character: character,
          ),
        ),
        CharacterImage(
          character: character,
        )
      ],
    );
  }
}

class _MainCharactersName extends StatelessWidget {
  const _MainCharactersName({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextWithGradient(
        gradient: AppGradients.lightGreenToBlue,
        text: character.name,
        style: HomeViewTextStyles.cardSwiperName,
      ),
    );
  }
}
