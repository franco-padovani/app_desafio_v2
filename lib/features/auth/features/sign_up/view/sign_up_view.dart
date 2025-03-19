import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/field_value_providers.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/input_field.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final showScreenNotifier = ref.read(screenControllerProvider.notifier);

    final emailState = ref.watch(emailProvider);
    final passwordState = ref.watch(passwordProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              provider: emailProvider,
              hintText: 'example@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              provider: passwordProvider,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 40,
            ),
            SignUpButton(
              email: emailState,
              password: passwordState,
            ),
            SizedBox(height: 10),
            SwitchScreen(
              switchScreen: showScreenNotifier.changeToSignInScreen,
              message: 'Already have an account?',
              buttonText: 'Sign In',
            )
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends ConsumerWidget {
  const SignUpButton({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign Up'),
    );
  }
}
