import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/empty_cart.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_coupon_section.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';

class ProductCartContent extends StatefulWidget {
  const ProductCartContent({super.key});

  @override
  State<ProductCartContent> createState() => _ProductCartContentState();
}

class _ProductCartContentState extends State<ProductCartContent> {
  List<int> cartItemList = [1, 1, 1, 1, 1];

  int itemList = 2;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: itemList != 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Row(
                  children: [
                    Text(
                  'My cart',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
                ),

                const SizedBox(width: 8),

                   Padding(
                     padding: const EdgeInsets.only(top: 9),
                     child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.softGreen,
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: Text('2 Items', style: theme.headlineSmall?.copyWith(fontSize: 13),),
                     ),
                   )
                  ],
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemList,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: CartProductCard(
                              index: index,
                              theme: theme,
                              cartItemList: cartItemList,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      CartCouponSection(onApply: () {}),

                      const SizedBox(height: 20),

                      CartTotalAmount(cartItemList: cartItemList),

                      const SizedBox(height: 40),

                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 300),
                        child: PrimaryButton(title: 'Checkout'),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            )
          : EmptyCart(),
    );
  }
}
