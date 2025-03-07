import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:flutter/material.dart';

class PersonalizedCircleAvatar extends StatelessWidget {
  const PersonalizedCircleAvatar({
    super.key,
    required this.isAsset,
    required this.image,
    required this.imageRadius,
    this.borderRadius,
  });

  final String image;
  final double imageRadius;
  final double? borderRadius;
  final bool isAsset;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: borderRadius ?? imageRadius,
      backgroundColor: AppColors.white,
      child: CircleAvatar(
        backgroundImage: (isAsset) ? AssetImage(image) : NetworkImage(image),
        radius: imageRadius,
      ),
    );
  }
}
