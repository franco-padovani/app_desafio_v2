import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/viewmodel/user_sign_up_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/sign_up_state.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/input_field.dart';
import 'package:app_desafio_v2/features/auth/shared/widgets/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final showScreenNotifier = ref.read(screenControllerProvider.notifier);

    final userSignUpState = ref.watch(signUpUserProvider);
    final userSignUpNotifier = ref.read(signUpUserProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              hideInput: false,
              type: 'email',
              signProvider: signUpControllProvider,
              hintText: 'example@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hideInput: true,
              type: 'password',
              signProvider: signUpControllProvider,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hideInput: true,
              type: 'confirm password',
              signProvider: signUpControllProvider,
              hintText: 'Confirm Password',
            ),
            const SizedBox(
              height: 40,
            ),
            userSignUpState.when(
              data: (state) {
                if (state is NullUserState) {
                  return Center(child: Text(state.error));
                } else if (state is NotMeetsPasswordCriteria) {
                  return Dialog.fullscreen(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text('Al menos una letra mayúscula (A-Z)'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text('Al menos una letra minúscula (a-z)'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text('Al menos un número (0-9)'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text(
                              'Al menos un carácter especial (@, \$, !, %, *, ?, &)'),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.green),
                          title: Text('Al menos un 8 caracteres'),
                        ),
                        TextButton(
                          onPressed: () {
                            userSignUpNotifier.retrySignUp();
                          },
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (state is NewUserBuildedState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.go(AppRoutes.home);
                  });
                  return SizedBox();
                } else if (state is FetchingState) {
                  return CircularProgressIndicator(strokeWidth: 2);
                }
                return Column(
                  children: [
                    _SignUpButton(
                      notifier: userSignUpNotifier,
                    ),
                    SizedBox(height: 10),
                    SwitchScreen(
                      switchScreen: showScreenNotifier.changeToSignInScreen,
                      message: 'Already have an account?',
                      buttonText: 'Sign In',
                    )
                  ],
                );
              },
              error: (error, _) => _buildErrorHandler(error),
              loading: () => Column(
                children: [
                  _SignUpButton(
                    notifier: userSignUpNotifier,
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
}

class _SignUpButton extends ConsumerWidget {
  const _SignUpButton({
    required this.notifier,
  });

  final SignUpUser notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpControllProvider);

    return FilledButton(
      onPressed: () {
        notifier.signUpUser(signUpState);
      },
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign Up'),
    );
  }
}
