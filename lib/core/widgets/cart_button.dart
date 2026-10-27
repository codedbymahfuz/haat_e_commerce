import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.itemCount, required this.onTap, this.padding});
 final EdgeInsetsGeometry? padding;
  final int itemCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart, color: AppColors.textPrimary, size: 24),

              Positioned(
                top: -17,
                right: -10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      itemCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
