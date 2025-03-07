import 'package:app_desafio_v2/features/shared/model/datasources/rick_and_morty_api_datasource.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/model/repositories/rick_and_morty_api_repository.dart';

class RickAndMortyApiRepositoryImpl extends RickAndMortyApiRepository {
  final RickAndMortyApiDatasource datasource;
  RickAndMortyApiRepositoryImpl(this.datasource);

  @override
  Future<List<Character>> getCharacters(
      [String nextPage = 'https://rickandmortyapi.com/api/character?page=1']) {
    return datasource.getCharacters(nextPage);
  }

  @override
  Future<Info> getInfo(
      [String nextPage = 'https://rickandmortyapi.com/api/character?page=1']) {
    return datasource.getInfo(nextPage);
  }
}
