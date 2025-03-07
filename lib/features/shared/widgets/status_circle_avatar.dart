import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/theme/themes.dart';
import 'package:app_desafio_v2/features/shared/model/entities/entities.dart';

class StatusCircleAvatar extends StatelessWidget {
  const StatusCircleAvatar({
    super.key,
    required this.character,
    required this.radius,
  });

  final Character character;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: _selectStatusColor(character.status),
      radius: radius,
    );
  }
}

_selectStatusColor(String status) => status == 'Alive'
    ? AppColors.aliveColor
    : status == 'Dead'
        ? AppColors.deadColor
        : AppColors.unknownColor;
