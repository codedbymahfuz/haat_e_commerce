import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/product_shop_screen.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: theme.headlineMedium),

        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _categoriesTitle(
                iconName: 'assets/icons/all.png',
                name: 'All',
                theme: theme,
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductShopScreen(currentButton: 'all'),
                    ),
                  );
                }
              ),
              const SizedBox(width: 10),
              _categoriesTitle(
                iconName: 'assets/icons/gadget.png',
                name: 'Gadgets',
                theme: theme,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductShopScreen(currentButton: 'gadgets'),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              _categoriesTitle(
                iconName: 'assets/icons/fashion.png',
                name: 'Fashion',
                theme: theme,
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductShopScreen(currentButton: 'fashion'),
                    ),
                  );
                }
              ),
              const SizedBox(width: 10),
              _categoriesTitle(
                iconName: 'assets/icons/living-room.png',
                name: 'Home',
                theme: theme,
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductShopScreen(currentButton: 'home'),
                    ),
                  );
                }
              ),
              const SizedBox(width: 10),
              _categoriesTitle(
                iconName: 'assets/icons/skincare.png',
                name: 'Beauty',
                theme: theme,
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductShopScreen(currentButton: 'beauty'),
                    ),
                  );
                }
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoriesTitle({
    required String iconName,
    required String name,
    required TextTheme theme,
    required void Function() onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              iconName,
              height: 35,
              width: 37,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 7),

        Text(name, style: theme.titleMedium),
      ],
    );
  }
}
