import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class CharacterMapper {
  static Character characterToEntity(Character character) => Character(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        type: character.type == '' ? 'No type' : character.type,
        gender: character.gender,
        origin: character.origin,
        location: character.location,
        image: character.image,
        episode: character.episode,
        url: character.url,
        created: character.created,
      );
}
