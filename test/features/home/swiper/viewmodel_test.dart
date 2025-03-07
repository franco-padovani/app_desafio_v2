import 'package:app_desafio_v2/features/home/presentation/swiper/viewmodel/main_characters_provider.dart';
import 'package:app_desafio_v2/features/shared/data/providers/r_and_m_repository_provider.dart';
import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';
import 'package:app_desafio_v2/features/shared/model/entities/info/info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../data/repositories/rick_and_morty_api_repository_test.mocks.dart';
import '../../../test_constants/info.dart';
import '../../../test_constants/main_characters.dart';

void main() {
  late MockRickAndMortyApiDatasourceImpl mockDatasource;
  late RickAndMortyApiRepositoryImpl mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockDatasource = MockRickAndMortyApiDatasourceImpl();
    mockRepository = RickAndMortyApiRepositoryImpl(mockDatasource);

    container = ProviderContainer(
      overrides: [
        rickAndMortyRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  group('mainCharactersProvider', () {
    test('inicia con una lista vacía', () {
      final characters = container.read(mainCharactersProvider);
      expect(characters, isEmpty);
    });

    test('obtiene los main characters', () async {
      // Start of stub
      when(mockRepository.getCharacters())
          .thenAnswer((_) async => mainCharacters);
      when(mockRepository.getInfo())
          .thenAnswer((_) async => Info.fromJson(infoFirstPage));
      // End of stub

      await container.read(mainCharactersProvider.notifier).getCharacters();

      final filteredCharacters = container.read(mainCharactersProvider);
      expect(filteredCharacters.length, mainCharacters.length);

      for (int i = 0; i < filteredCharacters.length; i++) {
        expect(filteredCharacters[i] == mainCharacters[i], true);
      }
    });
  });
}
