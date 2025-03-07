import 'expected_api_first_page_response.dart';

final maleCharactersFirstPage = expectedFirstPageApiCharacters
    .where((character) => character.gender == 'Male')
    .toList();
