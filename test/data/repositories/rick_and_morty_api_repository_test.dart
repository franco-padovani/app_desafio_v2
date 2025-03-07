import 'package:app_desafio_v2/features/shared/data/datasources/rick_and_morty_api_datasource_impl.dart';
import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_constants/expected_api_first_page_response.dart';
import 'rick_and_morty_api_repository_test.mocks.dart';

@GenerateMocks([RickAndMortyApiDatasourceImpl])
void main() {
  late RickAndMortyApiRepositoryImpl mockRickAndMortyApiRepositoryImpl;
  final mockRickAndMortyApiDatasourceImpl = MockRickAndMortyApiDatasourceImpl();

  setUp(() {
    mockRickAndMortyApiRepositoryImpl =
        RickAndMortyApiRepositoryImpl(mockRickAndMortyApiDatasourceImpl);
  });

  test('Successfully retrieve characters form APIs first page', () async {
    // Start of stub
    when(mockRickAndMortyApiRepositoryImpl.getCharacters())
        .thenAnswer((_) async => expectedFirstPageApiCharacters);
    // End of stub

    final expectedResult =
        await mockRickAndMortyApiRepositoryImpl.getCharacters();
    expect(
      expectedResult,
      expectedFirstPageApiCharacters,
    );
  });

  test('Successfully retrieve info form APIs first page', () async {
    // Start of stub
    when(mockRickAndMortyApiRepositoryImpl.getInfo())
        .thenAnswer((_) async => expectedFirstPageApiInfo);
    // End of stub

    final expectedResult = await mockRickAndMortyApiRepositoryImpl.getInfo();
    expect(
      expectedResult,
      expectedFirstPageApiInfo,
    );
  });
}
