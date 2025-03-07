import 'package:app_desafio_v2/features/favourites/presentation/view/favourites_view.dart';
import 'package:app_desafio_v2/features/home/presentation/view/home_view.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/view/filter_search_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const search = '/search';
  static const favourites = '/favourites';
  static const characterScreen = '/characterScreen';

  static final routes = [
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
