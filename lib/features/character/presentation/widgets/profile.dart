import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class Profile extends StatelessWidget {
  final Character character;
  const Profile({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Center(
                child: PersonalizedCircleAvatar(
                  isAsset: false,
                  image: character.image,
                  imageRadius: 100,
                  borderRadius: 105,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                child: Center(
                  child: Text(
                    character.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: CharacterScreenTextStyles.appBarTitleCharacterScreen,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 195,
          top: 185,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 20,
            child: StatusCircleAvatar(character: character, radius: 15),
          ),
        ),
      ],
    );
  }
}
