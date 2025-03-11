import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_by_gender_viewmodel.g.dart';

@riverpod
class FilterByGenderViewmodel extends _$FilterByGenderViewmodel {
  @override
  void build() {}

  void infiniteScroll({
    required ScrollController scrollController,
    required providerNotifier,
  }) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels + 500 >=
            scrollController.position.maxScrollExtent) {
          providerNotifier.getCharacters();
        }
      },
    );
  }

  void chechForMoreCharacters({
    required provider,
    required int minQuantityOfCharacters,
    required providerNotifier,
  }) {
    final characters = ref.watch(provider);

    Future(() {
      if (characters.length < minQuantityOfCharacters) {
        providerNotifier.getCharacters();
      }
    });
  }

  void scrollControllerListener(
    ScrollController scrollController,
    void Function(double) alreadyScrolledSetter,
  ) {
    scrollController.addListener(() {
      alreadyScrolledSetter(scrollController.position.pixels);
    });
  }
}
