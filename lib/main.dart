import 'package:app_desafio_v2/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
      url: 'https://iqclwyjwwkdlzeyilzbq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxY2x3eWp3d2tkbHpleWlsemJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIyMTI4MjQsImV4cCI6MjA1Nzc4ODgyNH0.82gKlnH95LIViZuqRUK8lizniC-dfGhL4WgEdjXwKbY');

  runApp(ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: GoRouter(
        initialLocation: AppRoutes.auth,
        routes: AppRoutes.routes,
      ),
    );
  }
}
