import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/responsive/responsive_layout.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/layouts/details/details_desktop_layout.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/layouts/details/details_mobile_layout.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/layouts/details/details_tablet_layout.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveLayout(
        mobile: DetailsMobileLayout(),
        tablet: DetailsTabletLayout(),
        desktop: DetailsDesktopLayout(),
      )
    );
  }

  
}
