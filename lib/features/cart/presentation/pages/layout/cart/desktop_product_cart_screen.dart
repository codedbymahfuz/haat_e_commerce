import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_coupon_section.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';

class DesktopProductCartScreen extends StatelessWidget {
  const DesktopProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> cartItemList = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

  int itemList = 10;
   final theme = TextTheme.of(context);
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(height: 10),

    Center(
      child: Text(
        'Cart $itemList',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ),

    const SizedBox(height: 25),

    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Expanded(
              flex: 7,
              child: _cartProductList(theme, cartItemList, itemList),
            ),
        
            const SizedBox(width: 25),
        
            
            Expanded(
              flex: 3,
              child: _cartSummary(theme, cartItemList),
            ),
          ],
        ),
      ),
    ),
  ],
);
  }

  Widget _cartSummary(TextTheme theme, List<int> cartItemList) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CartCouponSection(
          onApply: () {},
        ),

        const SizedBox(height: 20),

         CartTotalAmount(cartItemList: cartItemList),

        const SizedBox(height: 25),

        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: 'Checkout',
          ),
        ),
      ],
    ),
  );
}
  
  Widget _cartProductList(TextTheme theme, List<int> cartItemList, int itemList) {
  return ListView.builder(
    itemCount: itemList,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CartProductCard(
          index: index,
          theme: theme,
          cartItemList: cartItemList,
        ),
      );
    },
  );
}

}