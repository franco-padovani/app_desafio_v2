import 'package:app_desafio_v2/features/auth/shared/data/providers/user_repository_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_sign_up_provider.g.dart';

@riverpod
Future<User> signUpUser(Ref ref, String email, String password) async {
  final UserRepository userRepository = ref.read(userRepositoryProvider);
  try {
    final res = await userRepository.signUpNewUser(email, password);
    return res.user!;
  } catch (error) {
    throw Exception('Error al registrar al usuario: $error');
  }
}
