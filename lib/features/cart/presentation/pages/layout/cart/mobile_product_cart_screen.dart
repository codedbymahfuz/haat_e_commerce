import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/cart/presentation/widgets/product_cart_content.dart';

class MobileProductCartScreen extends StatefulWidget {
  const MobileProductCartScreen({super.key});

  @override
  State<MobileProductCartScreen> createState() =>
      _MobileProductCartScreenState();
}

class _MobileProductCartScreenState extends State<MobileProductCartScreen> {
  

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ProductCartContent(),
    );
  }
  }