import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_search_viewmodel.g.dart';

@riverpod
class FilterSearchViewmodel extends _$FilterSearchViewmodel {
  @override
  void build() {}
  (List<Character>, bool, double, int, bool, bool) initializeVariables(ref) {
    final charactersFromSearchState = ref.watch(searchCharactersProvider);
    final charactersFromFilterState =
        ref.watch(filterCharactersNotifierProvider);
    final pagesChargedState = ref.watch(pagesChargedProvider);
    final totalNumberOfPages =
        ref.watch(pagesChargedProvider.notifier).totalNumberOfPages;
    final isUsingFilterState = ref.watch(isUsingFilterProvider);
    final isFirstSearchState = ref.watch(isFirstSearchProvider);

    final double progressIndicator = pagesChargedState / totalNumberOfPages;
    final int progressPercent = (progressIndicator * 100).round();
    final bool displayProgressIndicator = progressPercent < 100;

    final characters = isUsingFilterState
        ? charactersFromFilterState
        : charactersFromSearchState;

    return (
      characters,
      displayProgressIndicator,
      progressIndicator,
      progressPercent,
      isFirstSearchState,
      isUsingFilterState
    );
  }

  void fetchInitialData() {
    Future.microtask(
      () {
        ref.read(getAllCharactersProvider.notifier).searchCharacters();
        ref.read(isFirstSearchProvider.notifier).setToTrue();
      },
    );
  }

  void searchControllerListener(SearchController _searchController) {
    _searchController.addListener(() {
      ref
          .read(searchQueryProvider.notifier)
          .setSearchQuery(_searchController.text);
      final String query = ref.read(searchQueryProvider);
      ref.read(searchCharactersProvider.notifier).searchCharacters(query);
    });
  }

  void scrollControllerListener(
    ScrollController scrollController,
    void Function(double) alreadyScrolledSetter,
  ) {
    scrollController.addListener(
      () {
        alreadyScrolledSetter(scrollController.position.pixels);
      },
    );
  }
}
