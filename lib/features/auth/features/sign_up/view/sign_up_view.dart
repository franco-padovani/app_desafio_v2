import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/viewmodel/user_sign_up_provider.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/field_value_providers.dart';
import 'package:app_desafio_v2/features/auth/shared/viewmodel/select_screen_provider.dart';
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

    final emailState = ref.watch(emailProvider);
    final passwordState = ref.watch(passwordProvider);
    final confirmPasswordState = ref.watch(confirmPasswordProvider);

    final userSignUpState = ref.watch(
        signUpUserProvider(emailState, passwordState, confirmPasswordState));
    final userSignUpNotifier = ref.watch(
        signUpUserProvider(emailState, passwordState, confirmPasswordState)
            .notifier);

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
              height: 20,
            ),
            InputField(
              hideInput: true,
              provider: confirmPasswordProvider,
              hintText: 'Confirm Password',
            ),
            const SizedBox(
              height: 40,
            ),
            userSignUpState.when(
              data: (state) {
                if (state is NullUserState) {
                  return Center(child: Text(state.error));
                } else if (state is NoMatchPassword ||
                    state is NotMeetsPasswordCriteria) {
                  return Column(
                    children: [
                      Text(
                        (state is NoMatchPassword)
                            ? 'Passwords do not match,'
                            : 'Al menos una letra mayúscula (A-Z). Al menos una letra minúscula (a-z). Al menos un número (0-9).              Al menos un carácter especial (@, \$, !, %, *, ?, &).',
                        style: AppTextStyles.smallErrorText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'To retry change your credentials',
                        style: AppTextStyles.smallErrorText,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                    SignUpButton(
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
                  SignUpButton(
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

class SignUpButton extends ConsumerWidget {
  const SignUpButton({
    super.key,
    required this.notifier,
  });

  final SignUpUser notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        notifier.signUpUser();
      },
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.aliveColor)),
      child: Text('Sign Up'),
    );
  }
}
