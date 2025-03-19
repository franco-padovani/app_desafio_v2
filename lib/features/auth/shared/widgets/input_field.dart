import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputField extends ConsumerStatefulWidget {
  const InputField({
    super.key,
    required this.hideInput,
    required this.provider,
    required this.hintText,
  });

  final bool hideInput;
  final AutoDisposeNotifierProvider<dynamic, String> provider;
  final String hintText;

  @override
  ConsumerState<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<InputField> {
  final TextEditingController _textFormFielController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(widget.provider.notifier);
    return TextFormField(
      onChanged: (newValue) {
        notifier.updateValue(newValue);
      },
      obscureText: widget.hideInput,
      controller: _textFormFielController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise, width: 3),
        ),
      ),
    );
  }
}
