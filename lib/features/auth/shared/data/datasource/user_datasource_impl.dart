import 'package:app_desafio_v2/features/auth/shared/model/datasource/user_datasource.dart';
import 'package:app_desafio_v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDatasourceImpl extends UserDatasource {
  @override
  Future<AuthResponse> signInWithEmail(String email, String password) async {
    final AuthResponse res = await supabase.auth
        .signInWithPassword(email: email, password: password);
    return res;
  }

  @override
  Future<AuthResponse> signUpNewUser(String email, String password) async {
    final AuthResponse res =
        await supabase.auth.signUp(email: email, password: password);
    return res;
  }
}
