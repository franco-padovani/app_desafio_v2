import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/viewmodel.dart';
import 'package:app_desafio_v2/features/shared/data/providers/providers.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

final filterByUnknownProvider =
    StateNotifierProvider<FilterByGenderNotifier, List<Character>>((ref) {
  final repository = ref.read(rickAndMortyRepositoryProvider);
  return FilterByGenderNotifier(
    ref: ref,
    repository: repository,
    gender: 'Unknown',
  );
});
