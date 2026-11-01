import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class CartCouponSection extends StatelessWidget {
  const CartCouponSection({
    super.key,
    required this.onApply,
  });

  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.border,
              ),
              color: AppColors.primary,
            ),
            child: const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                hintText: 'Coupon code (HAAT10)',
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: GestureDetector(
            onTap: onApply,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.border,
                ),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  'Apply',
                  style: theme.labelMedium?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}