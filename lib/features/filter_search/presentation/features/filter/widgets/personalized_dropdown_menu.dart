import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalizedDropdownMenu extends ConsumerStatefulWidget {
  const PersonalizedDropdownMenu(
      {required this.filterProvider,
      required this.hint,
      required this.items,
      super.key});

  final List<String> items;
  final String hint;
  final NotifierProvider<dynamic, String> filterProvider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalizedDropdownMenuState();
}

class _PersonalizedDropdownMenuState
    extends ConsumerState<PersonalizedDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    final filterProviderState = ref.watch(widget.filterProvider);
    final filterProviderNotifier = ref.read(widget.filterProvider.notifier);

    String selectedValue = filterProviderState;

    return DropdownButton(
      value: selectedValue,
      hint: Text(widget.hint),
      items: widget.items
          .map(
            (String item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (String? newValue) {
        filterProviderNotifier.changeValue(newValue ?? '');
      },
    );
  }
}
