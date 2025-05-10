import 'package:app_desafio_v2/features/auth/shared/data/datasource/user_datasource_impl.dart';
import 'package:app_desafio_v2/features/auth/shared/data/repository/user_repository_impl.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(UserDatasourceImpl());
}
