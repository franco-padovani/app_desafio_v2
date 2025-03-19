import 'package:app_desafio_v2/features/auth/features/sign_in/view/sign_in_view.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/view/sign_up_view.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  Widget build(BuildContext context) {
    final showScreen = ref.watch(screenControllerProvider);
    return Scaffold(
      body: switch (showScreen) {
        Screen.signIn => SignInView(),
        Screen.signUp => SignUpView(),
      },
    );
  }
}
