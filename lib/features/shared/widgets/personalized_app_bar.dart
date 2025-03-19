import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:app_desafio_v2/main.dart';
import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:go_router/go_router.dart';

class PersonalizedAppBar {
  const PersonalizedAppBar();

  AppBar appBar({
    required String title,
    required BuildContext context,
    List<Widget>? actions,
  }) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.primaryBackground,
      centerTitle: false,
      iconTheme: const IconThemeData(),
      title: Text(
        title,
        style: AppTextStyles.appBarTitle,
      ),
      actions:
          actions == null ? [SignOutButton()] : [...actions, SignOutButton()],
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          supabase.auth.signOut();
          context.go(AppRoutes.auth);
        },
        child: Text('Sign out'));
  }
}
