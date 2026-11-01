import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String title;
  final void Function()? onTap;
  final Color? buttonColor;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.padding,
    this.buttonColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: padding ?? EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.accent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),

        child: Center(
          child: Text(
            title,
            style:
                textStyle ??
                theme.titleMedium?.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
