import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_by_gender_viewmodel.g.dart';

@riverpod
class FilterByGenderViewmodel extends _$FilterByGenderViewmodel {
  @override
  void build() {}

  bool shouldFetchScroll({
    required ScrollController scrollController,
  }) {
    return (scrollController.position.pixels + 500 >=
        scrollController.position.maxScrollExtent);
  }

  bool shouldFetchMoreCharacters({
    required provider,
    required int minQuantityOfCharacters,
  }) {
    final characters = ref.watch(provider);

    return characters.length < minQuantityOfCharacters;
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
