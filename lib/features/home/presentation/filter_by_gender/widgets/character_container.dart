import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/images/images.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/character/presentation/view/character_view.dart';

class CharacterContainer extends StatelessWidget {
  final Character character;
  const CharacterContainer({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterView(character: character)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: AppRadius.circularRectangularBorder,
              child: FadeInImage(
                placeholder: const AssetImage(MyAssetImages.whitePlaceholder),
                image: NetworkImage(
                  character.image,
                ),
                width: 190,
                height: 150,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 200),
              ),
            ),
            SizedBox(
              width: 180,
              child: Text(
                character.name,
                style: HomeViewTextStyles.attributeTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${character.species}, ${character.status}',
            )
          ],
        ),
      ),
    );
  }
}
