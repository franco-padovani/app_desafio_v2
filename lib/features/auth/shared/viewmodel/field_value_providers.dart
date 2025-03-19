import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'field_value_providers.g.dart';

@riverpod
class Email extends _$Email {
  @override
  String build() {
    return '';
  }

  void updateValue(String newValue) => state = newValue;
}

@riverpod
class Password extends _$Password {
  @override
  String build() {
    return '';
  }

  void updateValue(String newValue) => state = newValue;
}
