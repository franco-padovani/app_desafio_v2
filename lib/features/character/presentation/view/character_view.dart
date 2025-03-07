import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/character/presentation/widgets/widgets.dart';
import 'package:app_desafio_v2/features/character/presentation/viewmodel/viewmodels.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

import 'package:app_desafio_v2/core/config/theme/colors.dart';

class CharacterView extends ConsumerWidget {
  final Character character;
  const CharacterView({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritesState = ref.watch(favouritesNotifierProvider);
    final favouritesNotifier = ref.read(favouritesNotifierProvider.notifier);

    final isFavourite = isFav(favouritesState, character);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.glowGreen,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                favouritesNotifier.toggleFavourite(character);
              },
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: isFavourite ? Colors.red : Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.lightGreenToBlue,
          ),
          child: Column(
            children: [
              Profile(character: character),
              Atributes(character: character)
            ],
          ),
        ),
      ),
    );
  }
}
