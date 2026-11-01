import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
     
      child: Row(
          children: [
            Expanded(
              child: _StatItem(
                onTap: () => debugPrint('Coupon Click'),
                title: 'Coupons',
                count: '2',
                theme: theme,
              ),
            ),
            Expanded(
              child: _StatItem(
                onTap: () => debugPrint('Wishlist Click'),
                title: 'Wishlist',
                count: '5',
                theme: theme,
              ),
            ),
            Expanded(
              child: _StatItem(
                onTap: () => debugPrint('History Click'),
                title: 'History',
                count: '12',
                theme: theme,
              ),
            ),
          ],
        ),
    );
  }
}


class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.onTap,
    required this.title,
    required this.count,
    required this.theme,
  });

  final VoidCallback onTap;
  final String title;
  final String count;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count, style: theme.titleLarge),
          const SizedBox(height: 2),
          Text(title, style: theme.labelMedium?.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}