import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel/filter_search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/widgets.dart';
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
    final viewmodel = ref.read(filterSearchViewmodelProvider.notifier);

    viewmodel.fetchInitialData();
    viewmodel.searchControllerListener(_searchController);
    viewmodel.scrollControllerListener(
        _scrollController, _alreadyScrolledSetter);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(filterSearchViewmodelProvider.notifier);
    final (
      characters,
      displayProgressIndicator,
      progressIndicator,
      progressPercent,
      isFirstSearchState,
      isUsingFilterState,
    ) = viewmodel.initializeVariables(ref);

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
