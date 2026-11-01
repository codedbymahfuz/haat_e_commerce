import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class CartTotalAmount extends StatelessWidget {
  final List<int> cartItemList;

  const CartTotalAmount({super.key, required this.cartItemList});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: theme.labelMedium),
              Text('Tk. 1,000'),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery', style: theme.labelMedium),
              Text('Free', style: theme.headlineSmall?.copyWith(fontSize: 13)),
            ],
          ),

          Divider(color: Color(0xFFE3EAE8), height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: theme.titleMedium),
              Text('Tk. 1,000', style: theme.titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}
