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

    providerNotifier.getCharacters();

    _infiniteScroll(
      scrollController: _scrollController,
      providerNotifier: providerNotifier,
      ref: ref,
    );

    super.initState();
  }

  void _infiniteScroll(
      {required ScrollController scrollController,
      required providerNotifier,
      required WidgetRef ref}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
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

    final providerNotifier = ref.read(widget.provider.notifier);

    _chechForMoreCharacters(
      characters: filteredCharacters,
      minQuantityOfCharacters: 4,
      providerNotifier: providerNotifier,
      ref: ref,
    );

    return (isLoading)
        ? _LoadingWidget()
        : HorizontalCharactersScroll(
            parentWidget: widget,
            scrollController: _scrollController,
            filteredCharacters: filteredCharacters,
          );
  }

  void _chechForMoreCharacters({
    required List<Character> characters,
    required int minQuantityOfCharacters,
    required providerNotifier,
    required WidgetRef ref,
  }) {
    Future(() {
      if (characters.length < minQuantityOfCharacters) {
        providerNotifier.getCharacters();
      }
    });
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
