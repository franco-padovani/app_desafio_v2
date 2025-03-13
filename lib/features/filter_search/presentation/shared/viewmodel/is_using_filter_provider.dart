import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_using_filter_provider.g.dart';

@riverpod
class IsUsingFilter extends _$IsUsingFilter {
  @override
  bool build() {
    return false;
  }

  void isUsingFilter() => state = true;
  void isNotUsingFilter() => state = false;
}
