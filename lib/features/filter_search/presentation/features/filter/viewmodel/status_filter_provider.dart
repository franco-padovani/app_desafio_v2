import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_filter_provider.g.dart';

@Riverpod(keepAlive: true)
class StatusFilter extends _$StatusFilter {
  @override
  String build() {
    return 'None';
  }

  void changeValue(String newValue) => state = newValue;

  void setAsDefault() => state = 'None';
}
