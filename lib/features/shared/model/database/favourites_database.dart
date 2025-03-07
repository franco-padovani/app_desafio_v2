import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

abstract class FavouritesDatabase {
  Future<void> insertCharacter(Character character);

  Future<List<Character>> getAllCharacters();

  Future<void> deleteCharacter(int id);
}
