import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';

part 'main_characters_provider.g.dart';

// Considero que los 'main characters' son los primeros 5 en la API
@riverpod
class MainCharacters extends _$MainCharacters {
  late final RickAndMortyApiRepositoryImpl repository;

  @override
  List<Character> build() {
    repository = ref.read(rickAndMortyRepositoryProvider);
    return [];
  }

  Future<void> getCharacters() async {
    final List<Character> rawCharacters = await repository.getCharacters();

    state = rawCharacters.take(5).toList();
  }
}
