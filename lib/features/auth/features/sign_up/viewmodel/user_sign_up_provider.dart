import 'package:app_desafio_v2/core/utils/regex_passwords_conditions.dart';
import 'package:app_desafio_v2/features/auth/shared/data/providers/user_repository_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/model/repository/user_repository.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/sign_up_state.dart';
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
  late final String _confirmPassword;
  late final SignUpControll _signUpControll;
  late final UserRepository _userRepository;

  @override
  Future<UserSignInState> build(SignUpState signUpState) async {
    _email = signUpState.email;
    _password = signUpState.password;
    _confirmPassword = signUpState.confirmPassword;
    _signUpControll = ref.read(signUpControllProvider.notifier);
    _userRepository = await ref.read(userRepositoryProvider);

    return InitialState();
  }

  Future<void> signUpUser() async {
    state = AsyncData(FetchingState());

    _signUpControll.validateFields();

    if (!_meetsPasswordCriteria(_password)) return;
    if (!_doPasswordsMatch(_password, _confirmPassword)) return;

    try {
      final res = await _userRepository.signUpNewUser(_email, _password);

      if (res.user == null) {
        state = AsyncData(NullUserState('Unexpected error'));
      } else {
        state = AsyncData(NewUserBuildedState(res.user!));
      }
    } catch (error, str) {
      state = AsyncError(error, str);
    }
  }

  bool _meetsPasswordCriteria(String password) {
    final conditions = passwordConditions;
    return conditions.hasMatch(password);
  }

  bool _doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
