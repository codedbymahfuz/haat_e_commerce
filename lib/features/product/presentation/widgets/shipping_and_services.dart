import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class ShippingAndServices extends StatelessWidget {
  const ShippingAndServices({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.local_shipping_outlined),
            title: Text('Free delivery', style: theme.titleMedium),
            subtitle: const Text('Arrives in 2-3 days to Dhaka'),
          ),
          
          ListTile(
            leading: const Icon(Icons.assignment_return_outlined),
            title: Text('7-day easy returns', style: theme.titleMedium),
            subtitle: const Text('No questions asked'),
          ),
          
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: Text('1-year warranty', style: theme.titleMedium),
            subtitle: const Text('Genuine product guaranteed'),
          ),
        ],
      ),
    );
  }
}
