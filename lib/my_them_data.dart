import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryDark)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColors.blackColor,
        selectedItemColor: AppColors.whiteColor,
        showSelectedLabels: true,
      ));
}
