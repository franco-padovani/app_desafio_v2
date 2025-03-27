import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_state.g.dart';

class SignInState {
  final String email;
  final String password;
  final String emailError;
  final String passwordError;

  SignInState({
    this.email = '',
    this.password = '',
    this.emailError = '',
    this.passwordError = '',
  });

  SignInState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}

@riverpod
class SignInController extends _$SignInController {
  @override
  SignInState build() {
    return SignInState();
  }

  void updateState({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    state = state.copyWith(
      email: email,
      password: password,
      emailError: emailError,
      passwordError: passwordError,
    );
  }
}
