import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:app_desafio_v2/features/auth/features/sign_in/sign_in_screen.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_screen_provider.g.dart';

sealed class SelectScreen {
  final Widget route;
  const SelectScreen(this.route);
}

class SelectSignUp extends SelectScreen {
  SelectSignUp() : super(SignUpScreen());
}

class SelectSignIn extends SelectScreen {
  SelectSignIn() : super(SignInScreen());
}

@riverpod
class ShowScreen extends _$ShowScreen {
  @override
  SelectScreen build() {
    return SelectSignUp();
  }

  void changeToSignInScreen() => state = SelectSignIn();

  void changeToSignUpScreen() => state = SelectSignUp();
}
