import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';
import 'package:app_desafio_v2/features/shared/model/entities/character/character.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFavouritesDatabaseImpl extends FavouritesDatabase {
  final SupabaseClient _supabase;

  SupabaseFavouritesDatabaseImpl(this._supabase);

  @override
  Future<void> insertCharacter(Character character) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('No authenticated user');

    final characterData = character.toJson();
    characterData['user_id'] = userId;

    await _supabase.from('characters').upsert(characterData);
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    final response = await _supabase.from('characters').select();
    return response.map((data) => Character.fromJson(data)).toList();
  }

  @override
  Future<void> deleteCharacter(int id) async {
    final userId = _supabase.auth.currentUser?.id;

    if (userId == null) return;

    await _supabase
        .from('characters')
        .delete()
        .match({'id': id, 'user_id': userId});
  }
}
