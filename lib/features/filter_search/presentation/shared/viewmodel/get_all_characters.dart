import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/filter_search/presentation/shared/viewmodel/shared_providers.dart';
import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

part 'get_all_characters.g.dart';

sealed class GetAllCharactersState {
  GetAllCharactersState();
}

class InitialState extends GetAllCharactersState {}

class FetchingState extends GetAllCharactersState {}

class FetchCompletedState extends GetAllCharactersState {
  List<Character> characters;

  FetchCompletedState(this.characters);
}

@Riverpod(keepAlive: true)
class GetAllCharacters extends _$GetAllCharacters {
  @override
  GetAllCharactersState build() {
    return InitialState();
  }

  Future<void> searchCharacters() async {
    if (state is FetchCompletedState || state is FetchingState) return;
    final List<Character> allCharactersFound = [];

    final String baseUrl = dotenv.env['API_CHARACTERS_BASE_URL'] ?? '';
    String nextPage = '${baseUrl}1';
    while (nextPage != '') {
      state = FetchingState();
      final List<Character> charactersFound =
          await _getCharactersPerPage(ref, nextPage);
      nextPage = await _getPage(ref, nextPage);
      allCharactersFound.addAll(charactersFound);
      ref.read(pagesChargedProvider.notifier).increment();
    }

    state = FetchCompletedState(allCharactersFound);
  }

  Future<List<Character>> _getCharactersPerPage(
      Ref ref, String nextPage) async {
    final apiRepository = ref.read(rickAndMortyRepositoryProvider);
    return await apiRepository.getCharacters(nextPage);
  }

  Future<String> _getPage(Ref ref, String actualPage) async {
    final apiRepository = ref.read(rickAndMortyRepositoryProvider);
    Info info = await apiRepository.getInfo(actualPage);
    return info.next ?? '';
  }
}
