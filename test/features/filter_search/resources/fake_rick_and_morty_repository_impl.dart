import 'dart:io';
import 'dart:convert';

import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/model/datasources/rick_and_morty_api_datasource.dart';

class FakeRickAndMortyApiRepositoryImpl
    implements RickAndMortyApiRepositoryImpl {
  @override
  final RickAndMortyApiDatasource datasource;

  FakeRickAndMortyApiRepositoryImpl(this.datasource);

  @override
  Future<List<Character>> getCharacters(
      [String nextPage =
          'https://rickandmortyapi.com/api/character?page=1']) async {
    final pageNumber = nextPage.split("page=").last;
    final jsonData = await _loadJson(
        'test/features/filter_search/resources/page_$pageNumber.json');

    return (jsonData['results'] as List)
        .map((character) => Character.fromJson(character))
        .toList();
  }

  @override
  Future<Info> getInfo(
      [String nextPage =
          'https://rickandmortyapi.com/api/character?page=1']) async {
    final pageNumber = nextPage.split("page=").last;
    final jsonData = await _loadJson(
        'test/features/filter_search/resources/page_$pageNumber.json');

    return Info.fromJson(jsonData['info']);
  }

  Future<Map<String, dynamic>> _loadJson(String path) async {
    final file = File(path);
    final jsonString = await file.readAsString();
    return json.decode(jsonString);
  }
}
