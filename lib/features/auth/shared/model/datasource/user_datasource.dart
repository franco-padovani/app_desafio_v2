import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserDatasource {
  Future<AuthResponse> signInWithEmail(String email, String password);
  Future<AuthResponse> signUpNewUser(String email, String password);
}
