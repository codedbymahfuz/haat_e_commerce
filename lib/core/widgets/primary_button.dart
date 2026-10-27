import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;

  const PrimaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),

        child: Center(
          child: Text(
            title,
            style: theme.titleMedium?.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
