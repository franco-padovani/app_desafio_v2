import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel.dart';
import 'package:app_desafio_v2/features/shared/data/datasources/rick_and_morty_api_datasource_impl.dart';
import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'resources/fake_rick_and_morty_repository_impl.dart';

void main() async {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        rickAndMortyRepositoryProvider.overrideWithValue(
            FakeRickAndMortyApiRepositoryImpl(RickAndMortyApiDatasourceImpl()))
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('filterCharacters filters correctly and updates state', () async {
    await container.read(getAllCharactersProvider.notifier).searchCharacters();

    final filterhNotifier =
        container.read(filterCharactersNotifierProvider.notifier);

    filterhNotifier.filterCharacters();

    final List<Character> foundCharacters =
        container.read(filterCharactersNotifierProvider);

    expect(
      foundCharacters.length,
      40,
    );

    // change both values to 'unknown'
    container.read(genderFilterProvider.notifier).changeValue('Unknown');
    container.read(statusFilterProvider.notifier).changeValue('Unknown');

    final List<Character> unknwonCharacters =
        container.read(filterCharactersNotifierProvider);

    final List<String> unknwonCharactersNames =
        unknwonCharacters.map((character) => character.name).toList();

    expect(
      unknwonCharactersNames,
      ['Alien Googah'],
    );
  });
}
