import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';
import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/character/presentation/view/character_view.dart';
import 'package:app_desafio_v2/features/character/presentation/viewmodel/character_favourite_provider.dart';

class FavouriteCard extends ConsumerWidget {
  final Character character;
  const FavouriteCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritesState = ref.watch(favouritesNotifierProvider);
    final favouritesNotifier = ref.read(favouritesNotifierProvider.notifier);

    final isFavourite = isFav(favouritesState, character);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterView(character: character)),
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circularRectangularBorder),
        child: _CardContent(
            character: character,
            favouritesNotifier: favouritesNotifier,
            isFavourite: isFavourite),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({
    required this.character,
    required this.favouritesNotifier,
    required this.isFavourite,
  });

  final dynamic character;
  final FavouritesNotifier favouritesNotifier;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: StatusCircleAvatar(character: character, radius: 10),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              favouritesNotifier.toggleFavourite(character);
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: isFavourite ? Colors.red : Colors.grey,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 5,
          child: Column(
            children: [
              PersonalizedCircleAvatar(
                isAsset: false,
                image: character.image,
                imageRadius: 40,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  character.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: AppTextStyles.mediumButtonText,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
