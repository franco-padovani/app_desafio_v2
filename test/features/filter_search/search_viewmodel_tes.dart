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
            FakeRickAndMortyApiRepositoryImpl(RickAndMortyApiDatasourceImpl())),
        searchCharactersProvider
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('searchCharacters filters all characters and updates state', () async {
    await container.read(getAllCharactersProvider.notifier).searchCharacters();
    final searchNotifier = container.read(searchCharactersProvider.notifier);

    searchNotifier.searchCharacters('Su');

    final List<Character> foundCharacters =
        container.read(searchCharactersProvider);

    final List<String> foundCharactersNames =
        foundCharacters.map((character) => character.name).toList();

    expect(foundCharactersNames,
        ['Summer Smith', 'Superhuman (Ghost trains summoner)']);

    expect(
      foundCharacters.length,
      2,
    );
  });
}
