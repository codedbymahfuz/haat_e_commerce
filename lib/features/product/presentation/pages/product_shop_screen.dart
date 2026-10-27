import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/cart_button.dart';
import 'package:haat_e_commerce/core/widgets/product_card_gridview.dart';
import 'package:haat_e_commerce/core/widgets/search_box.dart';

class ProductShopScreen extends StatefulWidget {
  final String? currentButton;
  const ProductShopScreen({super.key, this.currentButton});

  @override
  State<ProductShopScreen> createState() => _ProductShopScreenState();
}

class _ProductShopScreenState extends State<ProductShopScreen> {
  late String selectedCategory;

  String selectedSort = 'Popular';

  final List<String> categories = [
    'All',
    'Gadgets',
    'Fashion',
    'Home',
    'Beauty',
  ];

  List<String> sortOptions = [
    'Popular',
    'Newest',
    'Top Rated',
    'Price: Low to High',
    'Price: High to Low',
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.currentButton ?? 'all';
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),

            _buildHeader(),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCategoryList(theme),

                    const SizedBox(height: 18),

                    _buildSortDropdown(theme),

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

  Widget _buildCategoryList(TextTheme theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory.toLowerCase() == category.toLowerCase();
          return _buildCategoryButton(
            buttonName: category,
            theme: theme,
            isSelect: isSelected,
            onTap: () {
              setState(() {
                selectedCategory = category.toLowerCase();
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSortDropdown(TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${products.length} products',
          style: theme.titleSmall?.copyWith(fontSize: 14),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSort,
              icon: Icon(Icons.keyboard_arrow_down, size: 20),
              isDense: true,
              dropdownColor: AppColors.primary,
              items: sortOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('Sort: $value', style: TextStyle(fontSize: 14)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedSort = newValue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton({
    required String buttonName,
    required TextTheme theme,
    required void Function() onTap,
    bool isSelect = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: isSelect ? AppColors.textPrimary : AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            buttonName,
            style: theme.titleMedium?.copyWith(
              color: isSelect ? AppColors.primary : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
 
      children: [
        Expanded(child: SearchBox()),

          const SizedBox(width: 15),

        CartButton(
          padding: EdgeInsets.all(12),
          itemCount: 2,
          onTap: () {
            debugPrint('Cart Button Click');
          },
        ),
      ],
    );
  }
}
