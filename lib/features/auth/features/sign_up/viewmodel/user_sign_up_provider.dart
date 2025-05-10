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

class NoMatchPassword extends UserSignInState {}

class NotMeetsPasswordCriteria extends UserSignInState {}

class RetrySignUp extends UserSignInState {}

class NullUserState extends UserSignInState {
  final String error;

  NullUserState(this.error);
}

@riverpod
class SignUpUser extends _$SignUpUser {
  late final UserRepository _userRepository;
  late final SignUpControll _signUpControll;

  @override
  Future<UserSignInState> build() async {
    _signUpControll = ref.read(signUpControllProvider.notifier);
    _userRepository = await ref.read(userRepositoryProvider);

    return InitialState();
  }

  Future<void> signUpUser(SignUpState signUpState) async {
    state = AsyncData(FetchingState());

    _signUpControll.validateFields();

    final email = signUpState.email;
    final password = signUpState.password;
    final confirmPassword = signUpState.confirmPassword;

    if (!_meetsPasswordCriteria(password)) {
      state = AsyncData(NotMeetsPasswordCriteria());
    } else if (!_doPasswordsMatch(password, confirmPassword)) {
      state = AsyncData(NoMatchPassword());
    } else {
      try {
        final res = await _userRepository.signUpNewUser(email, password);

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

  void retrySignUp() => state = AsyncData(InitialState());

  bool _meetsPasswordCriteria(String password) {
    final conditions = passwordConditions;
    return conditions.hasMatch(password);
  }

  bool _doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
