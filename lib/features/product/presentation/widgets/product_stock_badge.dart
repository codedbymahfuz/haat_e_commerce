import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class ProductStockBadge extends StatelessWidget {
  final int productStock;
  const ProductStockBadge({super.key, this.productStock = 0});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return productStock != 0
        ? _buildStockStatus(
            backgroundColor: AppColors.softGreen,
            stockTextColor: AppColors.accent,
            title: 'In Stock $productStock available',
            style: theme.headlineSmall,
          )
        : _buildStockStatus(
            backgroundColor: Color(0xFFFDE8E9),
            stockTextColor: Color(0xFFE5484D),
            title: 'Out of stock',
            style: theme.headlineSmall?.copyWith(color: Color(0xFFB42318)),
          );
  }

  Widget _buildStockStatus({
    required Color backgroundColor,
    required Color stockTextColor,
    required String title,
    required TextStyle? style,
  }) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: stockTextColor,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 10),

          Text(title, style: style),
        ],
      ),
    );
  }
}
