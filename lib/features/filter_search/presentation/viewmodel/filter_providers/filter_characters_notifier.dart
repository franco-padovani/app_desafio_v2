import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel/viewmodel.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

part 'filter_characters_notifier.g.dart';

@riverpod
class FilterCharactersNotifier extends _$FilterCharactersNotifier {
  @override
  List<Character> build() {
    return [];
  }

  void filterCharacters() {
    List<Character> allCharacters = ref.watch(getAllCharactersProvider);
    String genderFilterState = ref.watch(genderFilterProvider);
    String statusFilterState = ref.watch(statusFilterProvider);

    state = allCharacters
        .where((character) =>
            _filterWith(
              type: character.gender,
              typeFilterValue: genderFilterState,
            ) &&
            _filterWith(
              type: character.status,
              typeFilterValue: statusFilterState,
            ))
        .toList();

    state.sort((a, b) => a.name.compareTo(b.name));
  }

  bool _filterWith({required String type, required String typeFilterValue}) =>
      typeFilterValue == 'None'
          ? true
          : type.toLowerCase() == typeFilterValue.toLowerCase();
}
