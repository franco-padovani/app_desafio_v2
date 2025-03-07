import 'expected_api_first_page_response.dart';

final unknownCharactersFirstPage = expectedFirstPageApiCharacters
    .where((character) => character.gender == 'unknown')
    .toList();
