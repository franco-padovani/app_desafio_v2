import 'package:app_desafio_v2/features/auth/shared/data/providers/user_repository_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_sign_up_provider.g.dart';

abstract class UserSignInState {
  const UserSignInState();
}

class InitialState extends UserSignInState {}

class FetchingState extends UserSignInState {}

class NewUserBuildedState extends UserSignInState {
  final User user;

  NewUserBuildedState(this.user);
}

class NullUserState extends UserSignInState {
  final String error;

  NullUserState(this.error);
}

@riverpod
class SignUpUser extends _$SignUpUser {
  late final String _email;
  late final String _password;
  late final UserRepository userRepository;

  @override
  Future<UserSignInState> build(String email, String password) async {
    _email = email;
    _password = password;
    userRepository = await ref.read(userRepositoryProvider);

    return InitialState();
  }

  Future<void> signUpUser() async {
    state = AsyncData(FetchingState());
    try {
      final res = await userRepository.signUpNewUser(_email, _password);

      if (res.user == null) {
        state = AsyncData(NullUserState('Unexpected error'));
      } else {
        state = AsyncData(NewUserBuildedState(res.user!));
      }
    } catch (error, str) {
      state = AsyncError(error, str);
    }
  }
}
