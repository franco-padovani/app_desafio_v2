import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/show_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final showScreenNotifier = ref.read(showScreenProvider.notifier);
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
            const SignUpButton(),
            SwitchToSignIn(showScreenNotifier: showScreenNotifier)
          ],
        ),
      ),
    );
  }
}

class SwitchToSignIn extends StatelessWidget {
  const SwitchToSignIn({
    super.key,
    required this.showScreenNotifier,
  });

  final ShowScreen showScreenNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Already have an account?'),
        TextButton(
          onPressed: () {
            showScreenNotifier.changeToSignInScreen();
          },
          child: Text('Sign In'),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

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

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.textFormFieldMailController,
    required this.hintText,
  });

  final TextEditingController textFormFieldMailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldMailController,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise, width: 3),
        ),
      ),
    );
  }
}
