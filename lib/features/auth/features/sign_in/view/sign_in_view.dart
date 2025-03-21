import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:app_desafio_v2/features/auth/features/sign_in/viewmodel/user_sign_in_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/field_value_providers.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/input_field.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInView> {
  @override
  Widget build(BuildContext context) {
    final showScreenNotifier = ref.read(screenControllerProvider.notifier);
    final emailState = ref.watch(emailProvider);
    final passwordState = ref.watch(passwordProvider);

    final userSignInState =
        ref.watch(signInUserProvider(emailState, passwordState));
    final userSignInNotifier =
        ref.watch(signInUserProvider(emailState, passwordState).notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              hideInput: false,
              provider: emailProvider,
              hintText: 'example@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hideInput: true,
              provider: passwordProvider,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 40,
            ),
            userSignInState.when(
              data: (state) {
                if (state is IncorrectCredentialsState) {
                  return Center(child: Text(state.error));
                } else if (state is CorrectCredentialsState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.go(AppRoutes.home);
                  });
                  return SizedBox();
                } else if (state is FetchingState) {
                  return CircularProgressIndicator(strokeWidth: 2);
                }
                return _buildAuthButtons(
                    userSignInNotifier, showScreenNotifier);
              },
              error: (error, _) => _buildErrorHandler(error),
              loading: () =>
                  _buildAuthButtons(userSignInNotifier, showScreenNotifier),
            )
          ],
        ),
      ),
    );
  }

  Builder _buildErrorHandler(Object error) {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: (error is AuthException)
                    ? Text(error.message.toString())
                    : Text('Ocurrio un error inesperado'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
        return Text('To retry change your credentials');
      },
    );
  }

  Column _buildAuthButtons(
      SignInUser userSignInNotifier, ScreenController showScreenNotifier) {
    return Column(
      children: [
        SignInButton(
          notifier: userSignInNotifier,
        ),
        SizedBox(height: 10),
        SwitchScreen(
          switchScreen: showScreenNotifier.changeToSignUpScreen,
          message: "Don't have an account?",
          buttonText: 'Sign Up',
        )
      ],
    );
  }
}

class SignInButton extends ConsumerWidget {
  const SignInButton({
    super.key,
    required this.notifier,
  });

  final SignInUser notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        notifier.signInUser();
      },
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign In'),
    );
  }
}
