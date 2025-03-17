import 'package:app_desafio_v2/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_desafio_v2/core/routes/routes.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          child: Center(child: Text('home'))),
    );
  }
}
