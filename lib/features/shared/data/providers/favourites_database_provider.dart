// import 'package:app_desafio_v2/features/shared/data/database/services/sembast_service.dart';
import 'package:app_desafio_v2/features/shared/data/database/supabase_favourites_database_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:app_desafio_v2/features/shared/data/database/sembast_favourites_database_impl.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'favourites_database_provider.g.dart';

@riverpod
FavouritesDatabase favouritesDB(ref) {
  // return SembastFavouritesDatabaseImpl(SembastService());
  return SupabaseFavouritesDatabaseImpl(Supabase.instance.client);
}
