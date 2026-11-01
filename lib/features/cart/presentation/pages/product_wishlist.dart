import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/core/widgets/product_card_gridview.dart';

class ProductWishlist extends StatefulWidget {
  const ProductWishlist({super.key});

  @override
  State<ProductWishlist> createState() => _ProductWishlistState();
}

class _ProductWishlistState extends State<ProductWishlist> {
  final isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text('WishList', style: theme.titleLarge),

          const SizedBox(height: 15),

          isEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    child: ProductCardGridView(productsItem: products),
                  ),
                )
              : const Expanded(child: Center(child: _EmptyWishList())),
        ],
      ),
    );
  }
}

class _EmptyWishList extends StatelessWidget {
  const _EmptyWishList();

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/icons/wishlist.png',
          height: 100,
          width: 100,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 10),

        Text(
          'Nothing saved yet',
          style: theme.titleMedium?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 8),
        Text(
          'Tap the heart on a product to save it for later',
          style: theme.titleSmall?.copyWith(fontSize: 14),
          maxLines: 2,
        ),

        const SizedBox(height: 20),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: PrimaryButton(
            title: 'Browse product',
            onTap: () {
              context.read<MainNavigationCubit>().changeTabAndCategory(1, 'all');
            },
          ),
        ),
      ],
    );
  }
}
