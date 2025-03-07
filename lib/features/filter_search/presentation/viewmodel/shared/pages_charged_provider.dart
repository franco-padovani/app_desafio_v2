import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pages_charged_provider.g.dart';

@Riverpod(keepAlive: true)
class PagesCharged extends _$PagesCharged {
  @override
  double build() {
    return 0;
  }

  void increment() => state++;

  int get totalNumberOfPages => 42;
}
