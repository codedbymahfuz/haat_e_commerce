import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
      // titleLarge: TextStyle(
      //   fontSize: 14,
      //   height: 1.2,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.textColor,
      // ),
      titleMedium: const TextStyle(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),

      titleSmall: const TextStyle(
        fontSize: 11,
        color: AppColors.subtitle,
      ),

      labelMedium: const TextStyle(
        color: AppColors.subtitle,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),

      headlineLarge: const TextStyle(
        color: AppColors.subtitle,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),

      headlineMedium: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),

      headlineSmall: const TextStyle(
        color: AppColors.accent,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    );
  }
}
