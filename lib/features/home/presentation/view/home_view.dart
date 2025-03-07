import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/home/presentation/filter_by_gender/filter_by_gender.dart';
import 'package:app_desafio_v2/features/home/presentation/swiper/view/character_swiper_view.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: const PersonalizedAppBar().appBar(title: 'Home'),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: ListView(
        children: [
          Column(
            children: [
              const CharacterSwiper(),
              CharacterList(
                gender: 'Male',
                provider: filterByMaleProvider,
              ),
              CharacterList(
                gender: 'Female',
                provider: filterByFemaleProvider,
              ),
              CharacterList(
                gender: 'Unknown',
                provider: filterByUnknownProvider,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
