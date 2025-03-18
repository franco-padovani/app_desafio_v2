import 'package:flutter/material.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({
    super.key,
    required this.switchScreen,
    required this.message,
    required this.buttonText,
  });

  final void Function() switchScreen;
  final String message;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        TextButton(
          onPressed: () {
            switchScreen();
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
