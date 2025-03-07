import 'package:app_desafio_v2/features/shared/data/providers/sembast_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/favourites/presentation/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/database/favourites_database.dart';

class FavouritesView extends ConsumerStatefulWidget {
  const FavouritesView({super.key});

  @override
  ConsumerState<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends ConsumerState<FavouritesView> {
  late final FavouritesDatabase favouritesDatabase;
  List<dynamic> favouriteCharacters = [];

  @override
  void initState() {
    super.initState();
    favouritesDatabase = ref.read(sembastFavouritesDBProvider);
    _loadFavourites();
  }

  Future<void> _loadFavourites() async {
    final characters = await favouritesDatabase.getAllCharacters();
    setState(() {
      favouriteCharacters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PersonalizedAppBar().appBar(
        title: 'Favourites',
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: favouriteCharacters.isEmpty
          ? const SelectFavouritesDialog()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
              ),
              itemCount: favouriteCharacters.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavouriteCard(
                    character: favouriteCharacters[index],
                  ),
                );
              },
            ),
    );
  }
}
