import 'package:app_desafio_v2/features/character/presentation/viewmodel/character_favourite_provider.dart';
import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_constants/rick_sanchez.dart';
import 'viewmodel_test.mocks.dart';

@GenerateMocks([FavouritesDatabase])
void main() {
  late FavouritesDatabase mockCharacterRepository;
  late ProviderContainer container;

  setUp(() {
    mockCharacterRepository = MockFavouritesDatabase();

    // Start of stub
    when(mockCharacterRepository.getAllCharacters())
        .thenAnswer((_) async => []);
    when(mockCharacterRepository.insertCharacter(rickSanchez))
        .thenAnswer((_) async {});
    when(mockCharacterRepository.deleteCharacter(rickSanchez.id))
        .thenAnswer((_) async {});
    // End of stub

    container = ProviderContainer(
      overrides: [
        sembastFavouritesDBProvider.overrideWithValue(mockCharacterRepository),
      ],
    );
  });

  group('toggleFavourite method', () {
    test('add favourite', () async {
      container
          .read(favouritesNotifierProvider.notifier)
          .toggleFavourite(rickSanchez);

      final favouriteCharactersfuture =
          container.read(favouritesNotifierProvider.future);
      final List<Character> favouriteCharacters =
          await favouriteCharactersfuture;
      for (var character in favouriteCharacters) {
        expect(character.name, rickSanchez.name);
      }
    });
    test('delete favourite', () async {
      // add favourite (already tested that this works)
      container
          .read(favouritesNotifierProvider.notifier)
          .toggleFavourite(rickSanchez);

      // delete favourite
      container
          .read(favouritesNotifierProvider.notifier)
          .toggleFavourite(rickSanchez);
      final favouriteCharactersfuture =
          container.read(favouritesNotifierProvider.future);
      final List<Character> favouriteCharacters =
          await favouriteCharactersfuture;

      expect(favouriteCharacters.isEmpty, true);
    });
  });
}
