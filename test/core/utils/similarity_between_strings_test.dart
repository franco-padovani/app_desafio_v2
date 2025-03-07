import 'package:flutter_test/flutter_test.dart';
import 'package:app_desafio_v2/core/utils/similarity_between_strings.dart';

void main() {
  group('similarityScore', () {
    test('should return full length for identical strings', () {
      expect(similarityScore('hello', 'hello'), 5);
    });

    test('should return 0 for completely different strings', () {
      expect(similarityScore('hello', 'world'), 0);
    });

    test('should return correct score for common prefixes', () {
      expect(similarityScore('test', 'team'), 2);
    });

    test('should handle different length strings', () {
      expect(similarityScore('dart', 'dark'), 3);
      expect(similarityScore('abc', 'a'), 1);
      expect(similarityScore('a', 'abc'), 1);
    });
  });
}
