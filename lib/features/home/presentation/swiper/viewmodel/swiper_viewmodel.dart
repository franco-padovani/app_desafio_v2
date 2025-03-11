import 'package:app_desafio_v2/features/home/presentation/swiper/viewmodel/main_characters_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'swiper_viewmodel.g.dart';

@riverpod
class SwiperViewmodel extends _$SwiperViewmodel {
  @override
  void build() {}

  void setCharacters() {
    ref.read(mainCharactersProvider.notifier).getCharacters();
  }
}
