import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

abstract class RickAndMortyApiDatasource {
  Future<Info> getInfo([
    String nextPage = 'https://rickandmortyapi.com/api/character?page=1',
  ]);

  Future<List<Character>> getCharacters([
    String nextPage = 'https://rickandmortyapi.com/api/character?page=1',
  ]);
}
