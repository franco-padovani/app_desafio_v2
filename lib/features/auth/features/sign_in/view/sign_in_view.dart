import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/input_field.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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
            const _SignInButton(),
            SizedBox(height: 10),
            SwitchScreen(
              switchScreen: showScreenNotifier.changeToSignUpScreen,
              message: 'Don’t have an account?',
              buttonText: 'Sign Up',
            )
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign In'),
    );
  }
}
