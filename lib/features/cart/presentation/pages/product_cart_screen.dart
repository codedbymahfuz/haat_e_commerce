import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/responsive/responsive_layout.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/layout/cart/desktop_product_cart_screen.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/layout/cart/mobile_product_cart_screen.dart';
import 'package:haat_e_commerce/features/cart/presentation/pages/layout/cart/tablet_product_cart_screen.dart';

class ProductCartScreen extends StatelessWidget {
  const ProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileProductCartScreen(),
      tablet: TabletProductCartScreen(),
      desktop: DesktopProductCartScreen(),
    );
  }
}
