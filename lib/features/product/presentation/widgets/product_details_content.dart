import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/cart_action_section.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/product_colors_list_section.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/product_image_list.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/rating_rate_section.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/shipping_and_services.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/top_headline.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      children: [
        const SizedBox(height: 20),

        const TopHeadline(),

        const SizedBox(height: 20),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageList(imageList: 5),

                const SizedBox(height: 9),

                Center(
                  child: Text(
                    'Swipe for more photos',
                    style: theme.titleSmall?.copyWith(fontSize: 13),
                  ),
                ),

                Row(
                  children: [
                    _buildTagChip(
                      padding: const EdgeInsets.all(5),
                      color: AppColors.cardMintBg,

                      child: Text(
                        'Sonic',
                        style: theme.titleMedium?.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text('4.8', style: theme.titleMedium),
                    const SizedBox(width: 4),
                    Text(
                      '(1240 reviews)',
                      style: theme.titleSmall?.copyWith(fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                Text('ANC Wireless Headphones', style: theme.titleLarge),

                const SizedBox(height: 9),

                Row(
                  children: [
                    Text('৳3,290', style: theme.titleLarge),
                    const SizedBox(width: 10),
                    Text(
                      '৳4,500',
                      style: theme.titleSmall?.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildTagChip(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      color: AppColors.cardCreamBg,
                      child: Text(
                        'Save ৳1,210',
                        style: theme.titleMedium?.copyWith(
                          color: AppColors.accentBrown,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  'Colour',
                  style: theme.titleMedium?.copyWith(fontSize: 15),
                ),

                const SizedBox(height: 10),

                ProductColorsListSection(),

                const SizedBox(height: 14),

                const ShippingAndServices(),

                const SizedBox(height: 10),

                Text('Ratings', style: theme.titleMedium),
                const SizedBox(height: 10),

                const RatingRateSection(),
              ],
            ),
          ),
        ),

        const SizedBox(height: 17),

        const CartActionSection(),
        const SizedBox(height: 7),
      ],
    );
  }

  Widget _buildTagChip({
    required EdgeInsetsGeometry padding,
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
