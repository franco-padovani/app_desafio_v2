import 'package:flutter/material.dart';

import 'package:app_desafio_v2/core/config/text/texts.dart';
import 'package:app_desafio_v2/core/config/theme/themes.dart';

class PersonalizedAppBar {
  const PersonalizedAppBar();

  AppBar appBar({
    required String title,
    List<Widget>? actions,
  }) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.primaryBackground,
      centerTitle: false,
      iconTheme: const IconThemeData(),
      title: Text(
        title,
        style: AppTextStyles.appBarTitle,
      ),
      actions: actions,
    );
  }
}
