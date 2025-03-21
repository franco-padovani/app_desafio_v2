import 'package:app_desafio_v2/features/character/presentation/viewmodel/character_favourite_provider.dart';
import 'package:app_desafio_v2/features/shared/data/providers/favourites_database_provider.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourites_viewmodel.g.dart';

@riverpod
class FavouritesViewmodel extends _$FavouritesViewmodel {
  late final List<Character> favouriteCharacters;
  late final FavouritesDatabase favouritesDatabase;
  late final FavouritesNotifier favouritesNotifier;

  @override
  Future<List<Character>> build() async {
    favouritesDatabase = ref.read(favouritesDBProvider);
    favouritesNotifier = ref.read(favouritesNotifierProvider.notifier);
    favouriteCharacters = await favouritesDatabase.getAllCharacters();
    return favouriteCharacters;
  }

  void deleteCharacter(Character character) async {
    await favouritesDatabase.deleteCharacter(character.id);
    if (state.value != null) {
      final newFavourites = state.value!
          .where((favCharacter) => favCharacter.id != character.id)
          .toList();

      state = AsyncValue.data(newFavourites);
    }
  }
}
