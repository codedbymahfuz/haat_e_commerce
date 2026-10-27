import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/cart_button.dart';
import 'package:haat_e_commerce/core/widgets/product_card_gridview.dart';
import 'package:haat_e_commerce/core/widgets/search_box.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/home_flash_deals_section.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/home_categories_section.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/widgets/banner_card.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/product_shop_screen.dart';

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
            const SizedBox(height: 13),
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

                    const SizedBox(height: 12),

                    HomeFlashDealsSection(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductShopScreen()));
                    },),

                    const SizedBox(height: 10),

                    Text('Recommended for you', style: theme.headlineMedium),

                    const SizedBox(height: 10),

                    ProductCardGridView(productsItem: products),
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
         CartButton(
          itemCount: 1,
          onTap: () {
            debugPrint('Cart Button Click');
          },
        ),
      ],
    );
  }
}
