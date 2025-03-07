import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/sealed_genders.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

final String baseUrl = dotenv.env['API_CHARACTERS_BASE_URL'] ?? '';

class FilterByGenderNotifier extends StateNotifier<List<Character>> {
  late final RickAndMortyApiRepositoryImpl repository;
  final Ref ref;
  final CharacterGender gender;
  final String baseUrl = dotenv.env['API_CHARACTERS_BASE_URL'] ?? '';

  String? lastPageLoaded;
  int currentPage = 1;
  int? totalPages;
  List<Character> filteredCharacters = [];

  FilterByGenderNotifier({
    required this.ref,
    required this.repository,
    required this.gender,
  }) : super([]);

  Future<void> getCharacters() async {
    if (totalPages == null) {
      await _initializeTotalPages();
    }

    _updatePage();

    String? nextPage = ref.read(nextPageProvider);

    if (lastPageLoaded == nextPage) return;
    lastPageLoaded = nextPage;

    if (nextPage == null) return;

    final List<Character> rawCharacters =
        await repository.getCharacters(nextPage);

    final filteredCharacters = rawCharacters
        .where((character) => _filterByGender(character.gender))
        .toList();

    filteredCharacters.shuffle();
    state = [...state, ...filteredCharacters];
    ref.read(isLoadingProvider.notifier).state = false;
  }

  bool _filterByGender(String characterGender) {
    return switch (gender) {
      Female() => characterGender.toLowerCase() == 'female',
      Male() => characterGender.toLowerCase() == 'male',
      Unknown() => characterGender.toLowerCase() == 'unknown',
    };
  }

  Future<void> refreshCharacters() async {
    state.shuffle();
  }

  void _updatePage() {
    if (currentPage <= totalPages!) {
      Future.delayed(
        Duration.zero,
        () {
          ref.read(nextPageProvider.notifier).state =
              '$baseUrl${currentPage.toString()}';
          currentPage++;
        },
      );
    }
  }

  Future<void> _initializeTotalPages() async {
    final Info info = await repository.getInfo();
    totalPages = info.pages;
  }
}

final nextPageProvider = StateProvider<String?>((ref) {
  final String baseUrl = dotenv.env['API_CHARACTERS_BASE_URL'] ?? '';
  return '${baseUrl}1';
});

final isLoadingProvider = StateProvider<bool>((ref) {
  return true;
});
