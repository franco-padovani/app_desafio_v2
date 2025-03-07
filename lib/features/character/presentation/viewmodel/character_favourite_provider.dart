import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';

part 'character_favourite_provider.g.dart';

@riverpod
class FavouritesNotifier extends _$FavouritesNotifier {
  late final FavouritesDatabase _favouritesDatabase;

  @override
  Future<List<Character>> build() async {
    _favouritesDatabase = ref.read(sembastFavouritesDBProvider);
    return await _favouritesDatabase.getAllCharacters();
  }

  Future<void> toggleFavourite(Character character) async {
    final currentFavourites = state.value ?? [];
    final isFav = currentFavourites.contains(character);

    if (isFav) {
      await _favouritesDatabase.deleteCharacter(character.id);
      state = AsyncData(
          currentFavourites.where((c) => c.id != character.id).toList());
    } else {
      await _favouritesDatabase.insertCharacter(character);
      state = AsyncData([...currentFavourites, character]);
    }
  }
}

bool isFav(favouritesState, Character character) =>
    favouritesState.value?.contains(character) ?? false;
