import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_screen_provider.g.dart';

enum Screen { signIn, signUp }

@riverpod
class ScreenController extends _$ScreenController {
  @override
  Screen build() {
    return Screen.signUp;
  }

  void changeToSignInScreen() => state = Screen.signIn;

  void changeToSignUpScreen() => state = Screen.signUp;
}
