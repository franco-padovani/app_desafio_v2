import 'package:app_desafio_v2/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputField extends ConsumerStatefulWidget {
  const InputField({
    super.key,
    required this.hideInput,
    required this.type,
    required this.signProvider,
    required this.hintText,
  });

  final bool hideInput;
  final String type;
  final dynamic signProvider;
  final String hintText;

  @override
  ConsumerState<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<InputField> {
  final TextEditingController _textFormFielController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final signState = ref.watch(widget.signProvider);
    final signNotifier = ref.read(widget.signProvider.notifier);

    return TextFormField(
      onChanged: (newValue) {
        _updateNotifier(newValue, widget.type, signNotifier);
      },
      obscureText: (widget.hideInput) ? _isObscure : widget.hideInput,
      controller: _textFormFielController,
      decoration: InputDecoration(
        errorText: _showError(widget.type, signState).isNotEmpty
            ? _showError(widget.type, signState)
            : null,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueTurquoise, width: 3),
        ),
        suffixIcon: (widget.hideInput)
            ? IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  toggleIsObscure();
                },
              )
            : null,
      ),
    );
  }

  void toggleIsObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _updateNotifier(String newValue, String type, dynamic signNotifier) {
    switch (type) {
      case 'email':
        signNotifier.updateState(email: newValue);
      case 'password':
        signNotifier.updateState(password: newValue);
      case 'confirm password':
        signNotifier.updateState(confirmPassword: newValue);
      default:
    }
  }

  String _showError(String type, dynamic signState) {
    switch (type) {
      case 'email':
        return signState.emailError;
      case 'password':
        return signState.passwordError;
      case 'confirm password':
        return signState.confirmPasswordError;
      default:
        return '';
    }
  }
}
