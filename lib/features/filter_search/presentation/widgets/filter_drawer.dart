import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/viewmodel/filter_providers/filter_providers.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/widgets/widgets.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class FilterDrawer extends ConsumerStatefulWidget {
  const FilterDrawer({
    required this.filterCharacters,
    super.key,
  });

  final AutoDisposeNotifierProvider<FilterCharactersNotifier, List<Character>>
      filterCharacters;

  @override
  ConsumerState<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends ConsumerState<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    final filterCharactersNotifier = ref.read(widget.filterCharacters.notifier);

    return Drawer(
      width: 300,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const _TitleAndSubtitle(),
              const SizedBox(
                height: 50,
              ),
              const _PersonalizedDropdownMenus(),
              const SizedBox(
                height: 50,
              ),
              _FilterButton(filterCharactersNotifier: filterCharactersNotifier),
              _SetToDefaultButton(ref: ref)
            ],
          ),
        ),
      ),
    );
  }
}

class _SetToDefaultButton extends StatelessWidget {
  const _SetToDefaultButton({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          ref.read(genderFilterProvider.notifier).setAsDefault();
          ref.read(statusFilterProvider.notifier).setAsDefault();
        },
        child: const Text(
          'Set as default',
          style: SearchScreenTextStyles.smallButtonText,
        ));
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.filterCharactersNotifier,
  });

  final FilterCharactersNotifier filterCharactersNotifier;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        filterCharactersNotifier.filterCharacters();
        Scaffold.of(context).closeDrawer();
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.secondaryButton)),
      child: const Text(
        'Filter',
        style: SearchScreenTextStyles.smallFilledButtonText,
      ),
    );
  }
}

class _PersonalizedDropdownMenus extends StatelessWidget {
  const _PersonalizedDropdownMenus();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalizedDropdownMenu(
          filterProvider: genderFilterProvider,
          hint: 'Select gender',
          items: ['None', 'Male', 'Female', 'Unknown'],
        ),
        const SizedBox(
          height: 20,
        ),
        PersonalizedDropdownMenu(
          filterProvider: statusFilterProvider,
          hint: 'Select status',
          items: ['None', 'Alive', 'Dead', 'Unknown'],
        ),
      ],
    );
  }
}

class _TitleAndSubtitle extends StatelessWidget {
  const _TitleAndSubtitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'FILTER',
          style: AppTextStyles.appBarTitle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Look for your favourite characters ...',
          style: AppTextStyles.subTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
