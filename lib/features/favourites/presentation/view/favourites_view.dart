import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/favourites/presentation/viewmodel/favourites_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/features/favourites/presentation/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class FavouritesView extends ConsumerStatefulWidget {
  const FavouritesView({super.key});

  @override
  ConsumerState<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends ConsumerState<FavouritesView> {
  List<dynamic> favouriteCharacters = [];

  @override
  Widget build(BuildContext context) {
    final favouriteCharacters = ref.watch(favouritesViewmodelProvider);
    return Scaffold(
      appBar: const PersonalizedAppBar().appBar(
        title: 'Favourites',
        context: context,
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Stack(
        children: [
          favouriteCharacters.when(
            data: (favouriteCharacters) => favouriteCharacters.isEmpty
                ? const SelectFavouritesDialog()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
            error: (error, stackTrace) => throw Exception(error.toString()),
            loading: () => const SizedBox(),
          ),
          FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 500)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox();
                } else {
                  return Container(
                      width: 1000,
                      height: 1000,
                      decoration:
                          BoxDecoration(color: AppColors.primaryBackground),
                      child: Center(
                          child: const CircularProgressIndicator(
                        color: AppColors.glowGreen,
                        strokeWidth: 2,
                      )));
                }
              }),
        ],
      ),
    );
  }
}
