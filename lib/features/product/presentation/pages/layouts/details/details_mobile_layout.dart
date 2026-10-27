import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/product_details_content.dart';

class DetailsMobileLayout extends StatefulWidget {
  const DetailsMobileLayout({super.key});

  @override
  State<DetailsMobileLayout> createState() => _DetailsMobileLayoutState();
}

class _DetailsMobileLayoutState extends State<DetailsMobileLayout> {
  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ProductDetailsContent(),
      ),
    );
  }
  }

