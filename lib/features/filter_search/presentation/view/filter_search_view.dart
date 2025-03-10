import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});
  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final SearchController _searchController = SearchController();
  final ScrollController _scrollController = ScrollController();

  bool _alreadyScrolled = false;

  @override
  void initState() {
    super.initState();

    _fetchInitialData();
    _setListeners();
  }

  void _fetchInitialData() {
    Future.microtask(
      () {
        ref.read(getAllCharactersProvider.notifier).searchCharacters();
        ref.read(isFirstSearchProvider.notifier).setToTrue();
      },
    );
  }

  void _setListeners() {
    _searchController.addListener(() {
      ref
          .read(searchQueryProvider.notifier)
          .setSearchQuery(_searchController.text);
      final String query = ref.read(searchQueryProvider);
      ref.read(searchCharactersProvider.notifier).searchCharacters(query);
    });

    _scrollController.addListener(() {
      _alreadyScrolledSetter(_scrollController.position.pixels);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (
      characters,
      displayProgressIndicator,
      progressIndicator,
      progressPercent,
      isFirstSearchState,
      isUsingFilterState,
    ) = _initializeVariables();

    return Scaffold(
      drawer: FilterDrawer(
        filterCharacters: filterCharactersNotifierProvider,
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            FilterSearchWidget(
              searchController: _searchController,
              isUsingFilterProvider: isUsingFilterProvider,
              enableButtons: !displayProgressIndicator,
            ),
            (displayProgressIndicator)
                ? PersonalizedProgressIndicator(
                    progressIndicator: progressIndicator,
                    progressPercent: progressPercent,
                  )
                : (characters.isEmpty && !isFirstSearchState)
                    ? NothingFoundWidget(
                        message: (isUsingFilterState)
                            ? "Click the blue button 'Filter' to Filter, Duh!"
                            : "Oh no! We couldn't find anything! 😱",
                      )
                    : Expanded(
                        child: Stack(
                          children: [
                            ListViewOfCharacters(
                                characters: characters,
                                scrollController: _scrollController,
                                ref: ref),
                            ScrollToStartButton(
                              scrollController: _scrollController,
                              isVisible: _alreadyScrolled,
                              right: 20,
                              bottom: 20,
                              animationDirection: AnimationDirection.up,
                              icon: const Icon(Icons.arrow_upward_rounded),
                            )
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  (List<Character>, bool, double, int, bool, bool) _initializeVariables() {
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

  void _alreadyScrolledSetter(double scrollPosition) {
    if (mounted) {
      if (_alreadyScrolled != (scrollPosition > 600)) {
        setState(() {
          _alreadyScrolled = scrollPosition > 600;
        });
      }
    }
  }
}
