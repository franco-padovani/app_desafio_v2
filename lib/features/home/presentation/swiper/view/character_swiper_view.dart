import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/home/presentation/swiper/viewmodel/viewmodel.dart';
import 'package:app_desafio_v2/features/home/presentation/swiper/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';
import 'package:app_desafio_v2/features/shared/widgets/widgets.dart';

class CharacterSwiper extends ConsumerStatefulWidget {
  const CharacterSwiper({super.key});

  @override
  CharacterSwiperState createState() => CharacterSwiperState();
}

class CharacterSwiperState extends ConsumerState<CharacterSwiper> {
  bool _isLoopEnabled = false;
  @override
  void initState() {
    ref.read(mainCharactersProvider.notifier).getCharacters();
    /*
    Cuando activo el loop hace muchas vueltas al principio, asi que lo desactivo las 
    primeras milesimas de segundo para que no se vuelva loco y despues hago el loop infinito
    */
    _setLoop();

    super.initState();
  }

  void _setLoop() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isLoopEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Character> mainCharacters = ref.watch(mainCharactersProvider);
    return Column(
      children: [
        _SwiperTitle(),
        _SwiperCard(
          isLoopEnabled: _isLoopEnabled,
          mainCharacters: mainCharacters,
        ),
      ],
    );
  }
}

class _SwiperCard extends StatelessWidget {
  const _SwiperCard({
    required bool isLoopEnabled,
    required this.mainCharacters,
  }) : _isLoopEnabled = isLoopEnabled;

  final bool _isLoopEnabled;
  final List<Character> mainCharacters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(top: 10.0),
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: AppColors.blueTurquoise,
          ),
        ),
        autoplay: true,
        loop: _isLoopEnabled,
        itemCount: mainCharacters.length,
        itemBuilder: (context, index) {
          final character = mainCharacters[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CardSwiper(character: character),
          );
        },
      ),
    );
  }
}

class _SwiperTitle extends StatelessWidget {
  const _SwiperTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextWithGradient(
        gradient: AppGradients.lightGreenToBlue,
        text: 'Main Characters',
        style: HomeViewTextStyles.mainCharacters,
      ),
    );
  }
}
