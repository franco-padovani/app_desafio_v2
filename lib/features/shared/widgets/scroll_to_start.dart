import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';

enum AnimationDirection { up, down, left, right }

class ScrollToStartButton extends StatelessWidget {
  final ScrollController scrollController;
  final bool isVisible;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final AnimationDirection animationDirection;
  final Icon icon;

  const ScrollToStartButton(
      {super.key,
      required this.scrollController,
      required this.isVisible,
      this.top,
      this.right,
      this.bottom,
      this.left,
      required this.animationDirection,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Positioned(
            top: top,
            right: right,
            bottom: bottom,
            left: left,
            child: _buildAnimatedButton(),
          )
        : const SizedBox();
  }

  Widget _buildAnimatedButton() {
    Widget button = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.circularBorder,
      ),
      child: IconButton(
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        },
        icon: icon,
      ),
    );

    switch (animationDirection) {
      case AnimationDirection.up:
        return FadeInUp(
            duration: const Duration(milliseconds: 200), child: button);
      case AnimationDirection.down:
        return FadeInDown(
            duration: const Duration(milliseconds: 200), child: button);
      case AnimationDirection.left:
        return FadeInLeft(
            duration: const Duration(milliseconds: 200), child: button);
      case AnimationDirection.right:
        return FadeInRight(
            duration: const Duration(milliseconds: 200), child: button);
    }
  }
}
