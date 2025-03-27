import 'package:app_desafio_v2/features/auth/shared/data/providers/user_repository_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_sign_in_provider.g.dart';

abstract class UserSignInState {
  const UserSignInState();
}

class InitialState extends UserSignInState {}

class FetchingState extends UserSignInState {}

class CorrectCredentialsState extends UserSignInState {
  final User user;

  CorrectCredentialsState(this.user);
}

class IncorrectCredentialsState extends UserSignInState {
  final String error;

  IncorrectCredentialsState(this.error);
}

@riverpod
class SignInUser extends _$SignInUser {
  late final String _email;
  late final String _password;
  late final UserRepository userRepository;

  @override
  Future<UserSignInState> build(SignInState signInState) async {
    _email = signInState.email;
    _password = signInState.password;
    userRepository = await ref.read(userRepositoryProvider);

    return InitialState();
  }

  Future<void> signInUser() async {
    state = AsyncData(FetchingState());
    try {
      final res = await userRepository.signInWithEmail(_email, _password);

      if (res.user == null) {
        state = AsyncData(IncorrectCredentialsState('User not found'));
      } else {
        state = AsyncData(CorrectCredentialsState(res.user!));
      }
    } catch (error, str) {
      state = AsyncError(error, str);
    }
  }
}
