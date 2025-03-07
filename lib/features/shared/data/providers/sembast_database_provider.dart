import 'package:app_desafio_v2/features/shared/data/database/services/sembast_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_desafio_v2/features/shared/data/database/favourites_database_impl.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';

part 'sembast_database_provider.g.dart';

@riverpod
FavouritesDatabase sembastFavouritesDB(ref) {
  return FavouritesDatabaseImpl(SembastService());
}
