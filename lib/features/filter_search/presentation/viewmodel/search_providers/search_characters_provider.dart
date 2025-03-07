import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/core/utils/similarity_between_strings.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel/shared/shared_providers.dart';

part 'search_characters_provider.g.dart';

@riverpod
class SearchCharacters extends _$SearchCharacters {
  Timer? _debounce;

  @override
  List<Character> build() {
    return [];
  }

  void searchCharacters(String newQuery) {
    List<Character> allCharacters = ref.read(getAllCharactersProvider);

    final List<Character> filteredCharacters = allCharacters
        .where((c) => c.name.toLowerCase().contains(newQuery.toLowerCase()))
        .toList();

    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      filteredCharacters.sort((p, n) {
        int pDistance =
            similarityScore(p.name.toLowerCase(), newQuery.toLowerCase());
        int nDistance =
            similarityScore(n.name.toLowerCase(), newQuery.toLowerCase());
        return nDistance.compareTo(pDistance);
      });
      state = filteredCharacters;
    });
  }
}
