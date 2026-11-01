import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/product_cart_content.dart';

class TabletProductCartScreen extends StatelessWidget {
  const TabletProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500),
            child: ProductCartContent(),
            ),
      ),
    );
  }
}