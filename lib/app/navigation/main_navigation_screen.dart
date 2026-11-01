import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_state.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/product_cart_screen.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/product_wishlist.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/home_screen.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/product_shop_screen.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    ProductShopScreen(),
    ProductWishlist(),
    ProductCartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return BlocBuilder<MainNavigationCubit, MainNavigationState>(
      builder: (context, state) {
        final currentIndex = state.tabIndex;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: _appBar(),
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: IndexedStack(index: currentIndex, children: _pages),
          ),

          bottomNavigationBar: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.primary,

                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  _buildNavigationBar(
                    Icons.home,
                    "Home",
                    0,
                    currentIndex,
                    theme,
                  ),
                  _buildNavigationBar(
                    Icons.shopping_bag,
                    "Shop",
                    1,
                    currentIndex,
                    theme,
                  ),
                  _buildNavigationBar(
                    Icons.favorite_outline,
                    "Saved",
                    2,
                    currentIndex,
                    theme,
                  ),

                  _buildCartNavigationBar(3, currentIndex, theme),

                  _buildNavigationBar(
                    Icons.person,
                    "Me",
                    4,
                    currentIndex,
                    theme,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 17,
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildNavigationBar(
    IconData icon,
    String label,
    int tabIndex,
    int currentIndex,
    TextTheme theme,
  ) {
    bool isSelected = currentIndex == tabIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<MainNavigationCubit>().changeTabAndCategory(
            tabIndex,
            'all',
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.accent : AppColors.subtitle,
            ),

            const SizedBox(height: 3),

            Text(label, style: theme.labelMedium?.copyWith(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildCartNavigationBar(
    int tabIndex,
    int currentIndex,
    TextTheme theme,
  ) {
    final isSelected = currentIndex == tabIndex;

    final cartItem = 0;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<MainNavigationCubit>().changeTabAndCategory(
            tabIndex,
            'all',
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: isSelected ? AppColors.accent : AppColors.subtitle,
                  size: 24,
                ),

                if (cartItem > 0)
                  Positioned(
                    top: -8,
                    right: -10,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(
                        minWidth: 17,
                        minHeight: 17,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          cartItem > 99 ? '99+' : cartItem.toString(),
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

            const SizedBox(height: 3),

            Text('Cart', style: theme.labelMedium?.copyWith(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
