import 'package:app_desafio_v2/features/auth/view/auth_view.dart';
import 'package:app_desafio_v2/features/auth/features/sign_in/sign_in_screen.dart';
import 'package:app_desafio_v2/features/auth/features/sign_up/sign_up_screen.dart';
import 'package:app_desafio_v2/features/favourites/presentation/view/favourites_view.dart';
import 'package:app_desafio_v2/features/home/presentation/view/home_view.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/view/filter_search_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const auth = '/';
  static const signUp = '/signUp';
  static const signIn = '/signIn';
  static const home = '/home';
  static const search = '/search';
  static const favourites = '/favourites';
  static const characterScreen = '/characterScreen';

  static final routes = [
    GoRoute(
      name: '-1',
      path: auth,
      builder: (context, state) => AuthView(),
    ),
    GoRoute(
      name: 'Sign Up',
      path: signUp,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: 'Sign In',
      path: signIn,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      name: '0',
      path: home,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      name: '1',
      path: search,
      builder: (context, state) => SearchView(),
    ),
    GoRoute(
      name: '2',
      path: favourites,
      builder: (context, state) => FavouritesView(),
    ),
  ];
}
