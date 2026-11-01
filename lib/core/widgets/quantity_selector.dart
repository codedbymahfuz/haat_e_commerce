import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class QuantitySelector extends StatelessWidget {
 final void Function() onTapRemove;
 final void Function() onTapIncrease;
 final String countItem;
  const QuantitySelector({super.key, required this.onTapRemove, required this.countItem, required this.onTapIncrease});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTapRemove,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.remove, size: 18, color: AppColors.textPrimary,),
              ),
            ),

            const SizedBox(width: 10),

            Text(countItem),

            const SizedBox(width: 10),

            InkWell(
              onTap: onTapIncrease,
              child: Container(
                 padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.add, size: 18, color: AppColors.primary,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}