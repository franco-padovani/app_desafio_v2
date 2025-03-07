import 'expected_api_first_page_response.dart';

final femaleCharactersFirstPage = expectedFirstPageApiCharacters
    .where((character) => character.gender == 'Female')
    .toList();
