import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/female_characters_provider.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/male_characters_provider.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/unknown_characters_provider.dart';
import 'package:app_desafio_v2/features/shared/data/providers/r_and_m_repository_provider.dart';
import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';
import 'package:app_desafio_v2/features/shared/model/entities/info/info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../data/repositories/rick_and_morty_api_repository_test.mocks.dart';
import '../../../test_constants/female_characters.dart';
import '../../../test_constants/info.dart';
import '../../../test_constants/male_characters.dart';
import '../../../test_constants/unknwon_characters.dart';

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

  group('filterByFemaleProvider', () {
    test('inicia con una lista vacía', () {
      final characters = container.read(filterByFemaleProvider);
      expect(characters, isEmpty);
    });

    test('obtiene personajes filtrados por Female', () async {
      when(mockRepository.getCharacters())
          .thenAnswer((_) async => femaleCharactersFirstPage);
      when(mockRepository.getInfo())
          .thenAnswer((_) async => Info.fromJson(infoFirstPage));
      await container.read(filterByFemaleProvider.notifier).getCharacters();

      final filteredCharacters = container.read(filterByFemaleProvider);
      filteredCharacters.sort((a, b) => a.id.compareTo(b.id));
      expect(filteredCharacters.length, femaleCharactersFirstPage.length);
      for (int i = 0; i < filteredCharacters.length; i++) {
        expect(filteredCharacters[i] == femaleCharactersFirstPage[i], true);
      }
    });
  });

  group('filterByMaleProvider', () {
    test('inicia con una lista vacía', () {
      final characters = container.read(filterByMaleProvider);
      expect(characters, isEmpty);
    });

    test('obtiene personajes filtrados por Male', () async {
      when(mockRepository.getCharacters())
          .thenAnswer((_) async => maleCharactersFirstPage);
      when(mockRepository.getInfo())
          .thenAnswer((_) async => Info.fromJson(infoFirstPage));
      await container.read(filterByMaleProvider.notifier).getCharacters();

      final filteredCharacters = container.read(filterByMaleProvider);
      filteredCharacters.sort((a, b) => a.id.compareTo(b.id));
      expect(filteredCharacters.length, maleCharactersFirstPage.length);
      for (int i = 0; i < filteredCharacters.length; i++) {
        expect(filteredCharacters[i] == maleCharactersFirstPage[i], true);
      }
    });
  });

  group('filterByUnknownProvider', () {
    test('inicia con una lista vacía', () {
      final characters = container.read(filterByUnknownProvider);
      expect(characters, isEmpty);
    });

    test('obtiene personajes filtrados por Unknown', () async {
      // Start of stub
      when(mockRepository.getCharacters())
          .thenAnswer((_) async => unknownCharactersFirstPage);
      when(mockRepository.getInfo())
          .thenAnswer((_) async => Info.fromJson(infoFirstPage));
      // End of stub

      await container.read(filterByUnknownProvider.notifier).getCharacters();

      final filteredCharacters = container.read(filterByUnknownProvider);
      filteredCharacters.sort((a, b) => a.id.compareTo(b.id));
      expect(filteredCharacters.length, unknownCharactersFirstPage.length);
      for (int i = 0; i < filteredCharacters.length; i++) {
        expect(filteredCharacters[i] == unknownCharactersFirstPage[i], true);
      }
    });
  });
}
