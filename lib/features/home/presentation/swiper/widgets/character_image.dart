import 'package:flutter/widgets.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: AppRadius.circularRectangularBorder,
        child: Image.network(
          character.image,
          width: 120,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
