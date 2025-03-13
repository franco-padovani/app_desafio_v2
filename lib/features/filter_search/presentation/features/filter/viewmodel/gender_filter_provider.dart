import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gender_filter_provider.g.dart';

@Riverpod(keepAlive: true)
class GenderFilter extends _$GenderFilter {
  @override
  String build() {
    return 'None';
  }

  void changeValue(String newValue) => state = newValue;

  void setAsDefault() => state = 'None';
}
