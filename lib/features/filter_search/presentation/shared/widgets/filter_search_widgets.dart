import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/filter_search/presentation/shared/viewmodel/shared_providers.dart';

class FilterSearchWidget extends ConsumerWidget {
  final SearchController searchController;
  const FilterSearchWidget({
    super.key,
    required this.searchController,
    required this.isUsingFilterProvider,
    required this.enableButtons,
  });

  final AutoDisposeNotifierProvider<IsUsingFilter, bool> isUsingFilterProvider;
  final bool enableButtons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUsingFilterNotifier = ref.read(isUsingFilterProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _Filter(
            isUsingFilterNotifier: isUsingFilterNotifier,
            enableButtons: enableButtons,
          ),
          const SizedBox(
            width: 7,
          ),
          _Search(
            searchController: searchController,
            isUsingFilterNotifier: isUsingFilterNotifier,
            enableButtons: enableButtons,
          ),
        ],
      ),
    );
  }
}

class _Search extends StatelessWidget {
  final SearchController searchController;
  final IsUsingFilter isUsingFilterNotifier;
  final bool enableButtons;
  const _Search({
    required this.searchController,
    required this.isUsingFilterNotifier,
    required this.enableButtons,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        enabled: enableButtons,
        onChanged: (_) => isUsingFilterNotifier.isNotUsingFilter(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: AppRadius.circularBorder,
          ),
          suffixIcon: const Icon(Icons.search),
          hintText: 'Search',
          hintStyle: AppTextStyles.defaultText,
        ),
        controller: searchController,
      ),
    );
  }
}

class _Filter extends StatelessWidget {
  final IsUsingFilter isUsingFilterNotifier;
  final bool enableButtons;
  const _Filter({
    required this.isUsingFilterNotifier,
    required this.enableButtons,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (enableButtons)
          ? () {
              isUsingFilterNotifier.isUsingFilter();
              Scaffold.of(context).openDrawer();
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8),
        child: const Row(
          children: [
            Text(
              'Filter',
              style: AppTextStyles.defaultText,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.filter_alt_outlined,
              size: 20,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
