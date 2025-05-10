import 'package:app_desafio_v2/features/auth/shared/model/datasource/user_datasource.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);
  @override
  Future<AuthResponse> signInWithEmail(String email, String password) {
    return datasource.signInWithEmail(email, password);
  }

  @override
  Future<AuthResponse> signUpNewUser(String email, String password) {
    return datasource.signUpNewUser(email, password);
  }
}
