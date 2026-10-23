import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/product_card_gridview.dart';
import 'package:haat_e_commerce/core/widgets/search_box.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/home_flash_deals_section.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/home_categories_section.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/banner_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            _homeHeadLine(theme),
            const SizedBox(height: 7),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   SearchBox(),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: BannerCard(),
                    ),

                    const SizedBox(height: 20),

                    HomeCategoriesSection(),

                    const SizedBox(height: 10),


                     HomeFlashDealsSection(),

                    const SizedBox(height: 10),

                    Text('Recommended for you', style: theme.headlineMedium),

                    const SizedBox(height: 10),

                    ProductCardGridView(productsItem: products,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeHeadLine(TextTheme theme) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery to Sarishabari', style: theme.labelMedium),
        const SizedBox(height: 7),
        Text(
          'Hi, Mahfuz',
          textAlign: TextAlign.start,
          style: theme.titleMedium?.copyWith(fontSize: 17),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, right: 12),
      child: InkWell(
        onTap: () => debugPrint('Cart Button Click'),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none, 
            children: [
           
              Icon(
                Icons.shopping_cart, 
                color: AppColors.textPrimary,
                size: 24,
              ),
              
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
                  child: const Center(
                    child: Text(
                      '1',
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
    ),
  ],
);
  }
}
