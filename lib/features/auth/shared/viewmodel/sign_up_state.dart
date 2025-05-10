import 'package:app_desafio_v2/core/utils/regex_passwords_conditions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_state.g.dart';

class SignUpState {
  final String email;
  final String password;
  final String confirmPassword;
  final String emailError;
  final String passwordError;
  final String confirmPasswordError;

  SignUpState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.emailError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
  });

  bool get isValid =>
      emailError.isEmpty &&
      passwordError.isEmpty &&
      confirmPasswordError.isEmpty;

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
    );
  }
}

@riverpod
class SignUpControll extends _$SignUpControll {
  @override
  SignUpState build() {
    return SignUpState();
  }

  void updateState({
    String? email,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    state = state.copyWith(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  void validateFields() {
    String emailError =
        _meetsEmailCriteria(state.email) ? '' : 'Must set an email';
    String passwordError = _meetsPasswordCriteria(state.password)
        ? ''
        : 'Does not meet password criteria';
    String confirmPasswordError =
        state.password != state.confirmPassword ? 'passwords don\'t match' : '';

    updateState(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  bool _meetsPasswordCriteria(String password) {
    final conditions = passwordConditions;
    return conditions.hasMatch(password);
  }

  bool _meetsEmailCriteria(String email) {
    final conditions = emailConditions;
    return conditions.hasMatch(email);
  }
}
