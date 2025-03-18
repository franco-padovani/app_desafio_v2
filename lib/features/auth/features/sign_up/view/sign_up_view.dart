import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/input_field.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/switch_screen.dart';
import 'package:app_desafio_v2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _textFormFieldMailController =
      TextEditingController();
  final TextEditingController _textFormFieldPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final showScreenNotifier = ref.read(screenControllerProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              textFormFieldMailController: _textFormFieldMailController,
              hintText: 'example@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              textFormFieldMailController: _textFormFieldPasswordController,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 40,
            ),
            const _SignUpButton(),
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

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign Up'),
    );
  }
}
