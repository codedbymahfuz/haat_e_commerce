import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/product/presentation/widgets/product_details_content.dart';

class DetailsTabletLayout extends StatefulWidget {
  const DetailsTabletLayout({super.key});

  @override
  State<DetailsTabletLayout> createState() => _DetailsTabletLayoutState();
}

class _DetailsTabletLayoutState extends State<DetailsTabletLayout> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child : Center(
          child: ConstrainedBox(constraints: BoxConstraints(
            maxWidth: 500
          ), child: ProductDetailsContent(),
          ),
        )
      ),
    );
  }
  
}

