import 'dart:async';

import 'package:app_desafio_v2/features/shared/data/datasources/rick_and_morty_api_datasource_impl.dart';
import 'package:app_desafio_v2/features/shared/exceptions/exceptions.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late RickAndMortyApiDatasourceImpl datasource;

  setUp(() {
    datasource = RickAndMortyApiDatasourceImpl();
  });

  group('RickAndMortyApiDatasourceImpl', () {
    test('should return a list of Characters when the response is 200',
        () async {
      final result = await datasource.getCharacters();

      expect(result, isA<List<Character>>());
      expect(result.first.name, equals("Rick Sanchez"));
    });

    test('should throw NotFoundException when response is 404', () async {
      expect(
        () => datasource
            .getCharacters('https://rickandmortyapi.com/api/nonexistent'),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('should throw TimeoutException when API call times out', () async {
      expect(() => datasource.getCharacters('https://httpbin.org/delay/11'),
          throwsA(isA<TimeoutException>()));
    });
  });
}
