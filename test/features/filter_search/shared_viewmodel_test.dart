import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel/shared/shared_providers.dart';
import 'package:app_desafio_v2/features/shared/data/datasources/rick_and_morty_api_datasource_impl.dart';
import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'resources/fake_rick_and_morty_repository_impl.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        rickAndMortyRepositoryProvider.overrideWithValue(
            FakeRickAndMortyApiRepositoryImpl(RickAndMortyApiDatasourceImpl())),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('getAllCharacters fetches all characters and updates state', () async {
    final notifier = container.read(getAllCharactersProvider.notifier);

    await notifier.searchCharacters();
    final GetAllCharactersState allCharacters =
        container.read(getAllCharactersProvider);

    if (allCharacters is FetchCompletedState) {
      for (var i = 0; i < allCharacters.characters.length; i++) {
        expect(
          allCharacters.characters[i].id,
          i + 1,
        );
      }
      expect(
        allCharacters.characters.length,
        40,
      ); // Basado en los datos de los archivos JSON (2 paginas de 20) -> 2*20 = 40
    }
  });
}
