import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/shared/data/datasources/rick_and_morty_api_datasource_impl.dart';
import 'package:app_desafio_v2/features/shared/data/repositories/rick_and_morty_api_repository_impl.dart';

part 'r_and_m_repository_provider.g.dart';

@riverpod
RickAndMortyApiRepositoryImpl rickAndMortyRepository(ref) {
  return RickAndMortyApiRepositoryImpl(
    RickAndMortyApiDatasourceImpl(),
  );
}
