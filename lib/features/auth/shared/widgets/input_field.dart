import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.textFormFieldMailController,
    required this.hintText,
  });

  final TextEditingController textFormFieldMailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldMailController,
      decoration: InputDecoration(
        hintText: hintText,
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
