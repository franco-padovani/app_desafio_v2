import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sembast_web/sembast_web.dart';

import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class FavouritesDatabaseImpl extends FavouritesDatabase {
  final _store = intMapStoreFactory.store(dotenv.env['STORE_NAME']);
  final dynamic _db;
  FavouritesDatabaseImpl(this._db);

  @override
  Future<void> insertCharacter(Character character) async {
    final db = await _db.db;
    final characterJson = character.toJson();
    await _store.record(character.id).put(db, characterJson);
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    final db = await _db.db;

    final records = await _store.find(db);
    return records.map((record) => Character.fromJson(record.value)).toList();
  }

  @override
  Future<void> deleteCharacter(int id) async {
    final db = await _db.db;

    await _store.record(id).delete(db);
  }
}
