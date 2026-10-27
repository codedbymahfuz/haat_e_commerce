import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class RatingRateSection extends StatelessWidget {
  const RatingRateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Row(
      children: [
        Column(
          children: [
            Text('4.8', style: theme.titleLarge),
            const SizedBox(height: 5),
            Text(
              '1240 reviews',
              style: theme.titleSmall?.copyWith(fontSize: 16),
            ),
          ],
        ),

        const SizedBox(width: 18),

        Column(
          children: [
            _ratingRate(ratingList: 5, percentage: 0.8, theme: theme),
            _ratingRate(ratingList: 4, percentage: 0.5, theme: theme),
            _ratingRate(ratingList: 3, percentage: 0.3, theme: theme),
            _ratingRate(ratingList: 2, percentage: 0.2, theme: theme),
            _ratingRate(ratingList: 1, percentage: 0.1, theme: theme),
          ],
        ),
      ],
    );
  }

  Widget _ratingRate({required int ratingList, required double percentage, required TextTheme theme}) {
    double totalBarWidth = 140.0;
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 15,
            child: Text(ratingList.toString(), style: theme.titleMedium),
          ),
          SizedBox(width: 8),

          Container(
            width: totalBarWidth,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: Alignment.centerLeft,

            child: Container(
              width: totalBarWidth * percentage,
              decoration: BoxDecoration(
                color: AppColors.discount,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
