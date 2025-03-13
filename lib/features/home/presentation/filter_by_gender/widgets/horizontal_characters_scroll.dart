import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/filter_by_gender_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';
import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/widgets/widgets.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/view/character_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HorizontalCharactersScroll extends ConsumerStatefulWidget {
  const HorizontalCharactersScroll({
    super.key,
    required this.parentWidget,
    required ScrollController scrollController,
    required this.filteredCharacters,
  }) : _scrollController = scrollController;

  final CharacterList parentWidget;
  final ScrollController _scrollController;
  final List<Character> filteredCharacters;

  @override
  ConsumerState<HorizontalCharactersScroll> createState() =>
      _HorizontalCharactersScrollState();
}

class _HorizontalCharactersScrollState
    extends ConsumerState<HorizontalCharactersScroll> {
  bool _alreadyScrolled = false;

  @override
  void initState() {
    final viewmodel = ref.read(filterByGenderViewmodelProvider.notifier);

    viewmodel.scrollControllerListener(
        widget._scrollController, _alreadyScrolledSetter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          Align(
            alignment: Alignment(-0.9, 0),
            child: Text(
              widget.parentWidget.gender,
              style: HomeViewTextStyles.title,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  controller: widget._scrollController,
                  itemCount: widget.filteredCharacters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final character = widget.filteredCharacters[index];
                    return CharacterContainer(character: character);
                  },
                ),
                ScrollToStartButton(
                  scrollController: widget._scrollController,
                  isVisible: _alreadyScrolled,
                  top: 65,
                  left: 10,
                  animationDirection: AnimationDirection.left,
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _alreadyScrolledSetter(double scrollPosition) {
    if (mounted) {
      if (_alreadyScrolled != (scrollPosition > 1000)) {
        setState(() {
          _alreadyScrolled = scrollPosition > 1000;
        });
      }
    }
  }
}
