import 'package:app_desafio_v2/features/shared/data/database/favourites_database_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import '../../test_constants/rick_sanchez.dart';
import 'resources/fake_favourites_service.dart';

void main() {
  final FavouritesDatabaseImpl fakeRepository =
      FavouritesDatabaseImpl(FakeFavouritesService());
  test('database initialized with no characters', () async {
    final List<Character> characters = await fakeRepository.getAllCharacters();

    expect(characters, []);
  });
  test('test databasee functionality insertCharacter and deleteCharacter',
      () async {
    await fakeRepository.insertCharacter(rickSanchez);
    List<Character> onlyRickSanchez = await fakeRepository.getAllCharacters();

    expect(onlyRickSanchez.map((character) => character.id).toList(), [1]);

    await fakeRepository.deleteCharacter(rickSanchez.id);

    final List<Character> emptyList = await fakeRepository.getAllCharacters();

    expect(emptyList, []);
  });
}
