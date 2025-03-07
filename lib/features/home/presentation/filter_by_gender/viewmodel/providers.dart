import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/filter_by_gender_provider.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/viewmodel/sealed_genders.dart';
import 'package:app_desafio_v2/features/shared/data/providers/r_and_m_repository_provider.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterByGenderProvider = StateNotifierProvider.family<
    FilterByGenderNotifier, List<Character>, CharacterGender>((ref, gender) {
  final repository = ref.read(rickAndMortyRepositoryProvider);
  return FilterByGenderNotifier(
    ref: ref,
    repository: repository,
    gender: gender,
  );
});

final filterByFemaleProvider = filterByGenderProvider(const Female());

final filterByMaleProvider = filterByGenderProvider(const Male());

final filterByUnknownProvider = filterByGenderProvider(const Unknown());
