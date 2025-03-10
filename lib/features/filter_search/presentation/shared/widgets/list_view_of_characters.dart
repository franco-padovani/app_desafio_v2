import 'package:app_desafio_v2/features/character/presentation/view/character_view.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/shared/viewmodel/is_first_search_provider.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/character/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewOfCharacters extends StatelessWidget {
  const ListViewOfCharacters({
    super.key,
    required this.characters,
    required ScrollController scrollController,
    required this.ref,
  }) : _scrollController = scrollController;

  final List<Character> characters;
  final ScrollController _scrollController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        ref.read(isFirstSearchProvider.notifier).setToFalse();
        final Character character = characters[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterView(character: character),
                  ),
                ),
            child: CharacterCard(character: character));
      },
    );
  }
}
