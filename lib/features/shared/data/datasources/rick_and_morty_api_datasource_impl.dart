import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:app_desafio_v2/features/shared/data/mappers/character_mapper.dart';
import 'package:app_desafio_v2/features/shared/exceptions/exceptions.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/model/datasources/rick_and_morty_api_datasource.dart';

final String baseUrl = dotenv.env['API_CHARACTERS_BASE_URL'] ?? '';

class RickAndMortyApiDatasourceImpl extends RickAndMortyApiDatasource {
  @override
  Future<List<Character>> getCharacters([
    String nextPage = 'https://rickandmortyapi.com/api/character?page=1',
  ]) async {
    final decodedResponse = await apiResponse(nextPage);
    return decodedResponse.results
        .map((character) => CharacterMapper.characterToEntity(character))
        .toList();
  }

  @override
  Future<Info> getInfo(
      [String nextPage =
          'https://rickandmortyapi.com/api/character?page=1']) async {
    final decodedResponse = await apiResponse(nextPage);
    return decodedResponse.info;
  }

  Future<CharacterResponse> apiResponse(String nextPage) async {
    final http.Response response;
    try {
      response = await http
          .get(Uri.parse(nextPage))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 400:
            throw BadRequestException(
                message: 'Bad request', errorCode: response.statusCode);
          case 403:
            throw ForbiddenException(
                message: 'No permisions to perform this request',
                errorCode: response.statusCode);
          case 404:
            throw NotFoundException(
                message: 'Server not found', errorCode: response.statusCode);
          case _:
            throw GenericException(
                message: 'An error ocurred', errorCode: response.statusCode);
        }
      }

      return CharacterResponse.fromJson(json.decode(response.body));
    } on TimeoutException {
      throw TimeoutException(
          "Tiempo de espera agotado al obtener información.");
    }
  }
}
