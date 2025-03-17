import 'package:app_desafio_v2/features/auth/features/sign_in/sign_in_screen.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/sign_up_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_screen_provider.freezed.dart';
part 'select_screen_provider.g.dart';

@freezed
sealed class ScreenState with _$ScreenState {
  const factory ScreenState.signUp(Widget route) = SignUpScreenState;
  const factory ScreenState.signIn(Widget route) = SignInScreenState;
}

@riverpod
class ScreenController extends _$ScreenController {
  @override
  ScreenState build() {
    return const ScreenState.signUp(SignUpScreen());
  }

  void changeToSignInScreen() =>
      state = const ScreenState.signIn(SignInScreen());

  void changeToSignUpScreen() =>
      state = const ScreenState.signUp(SignUpScreen());
}
