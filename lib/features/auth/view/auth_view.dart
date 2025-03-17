import 'package:app_desafio_v2/features/auth/shared/viewmodel/show_screen_provider.dart';
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
    final showScreen = ref.watch(showScreenProvider);
    return Scaffold(
      body: showScreen.route,
    );
  }
}
