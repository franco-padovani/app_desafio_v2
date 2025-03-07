import 'package:flutter/widgets.dart';

class TextWithGradient extends StatelessWidget {
  final LinearGradient gradient;
  final String text;
  final TextStyle style;

  const TextWithGradient({
    super.key,
    required this.gradient,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: style,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
