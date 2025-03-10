import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_first_search_provider.g.dart';

@riverpod
class IsFirstSearch extends _$IsFirstSearch {
  @override
  bool build() {
    return true;
  }

  void setToTrue() => state = true;
  void setToFalse() => Future(() {
        state = false;
      });
}
