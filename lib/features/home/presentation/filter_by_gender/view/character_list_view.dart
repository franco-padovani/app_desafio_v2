import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/filter_by_gender_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/viewmodel.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class CharacterList extends ConsumerStatefulWidget {
  final String gender;
  final StateNotifierProvider<FilterByGenderNotifier, List<Character>> provider;
  const CharacterList(
      {super.key, required this.gender, required this.provider});

  @override
  CharacterListState createState() => CharacterListState();
}

class CharacterListState extends ConsumerState<CharacterList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    final providerNotifier = ref.read(widget.provider.notifier);
    final viewmodel = ref.read(filterByGenderViewmodelProvider.notifier);

    _setScrollListener(providerNotifier, viewmodel);

    super.initState();
  }

  void _setScrollListener(FilterByGenderNotifier providerNotifier,
      FilterByGenderViewmodel viewmodel) {
    providerNotifier.getCharacters();
    _scrollController.addListener(() {
      if (viewmodel.shouldFetchScroll(scrollController: _scrollController)) {
        providerNotifier.getCharacters();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);
    final filteredCharacters = ref.watch(widget.provider);
    final viewmodel = ref.read(filterByGenderViewmodelProvider.notifier);

    final providerNotifier = ref.read(widget.provider.notifier);

    if (viewmodel.shouldFetchMoreCharacters(
        provider: widget.provider, minQuantityOfCharacters: 4)) {
      providerNotifier.getCharacters();
    }

    return (isLoading)
        ? _LoadingWidget()
        : HorizontalCharactersScroll(
            parentWidget: widget,
            scrollController: _scrollController,
            filteredCharacters: filteredCharacters,
          );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 270,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.glowGreen,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
