import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/widgets/product_card.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/product_details_screen.dart';


class ProductCardGridView extends StatelessWidget {
  final List<Map<String, Object>> productsItem;
  const ProductCardGridView({super.key, required this.productsItem,});

  @override
  Widget build(BuildContext context) {
    final int crossAxisCount;

    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 500) {
      crossAxisCount = 2;
    } else if (screenWidth < 820) {
      crossAxisCount = 3;
    } else if (screenWidth < 1250) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: productsItem.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 300,
       
      ),
      itemBuilder: (context, index) {
        final item = productsItem[index];

        return GestureDetector(
          onTap: () => debugPrint('Product item click'),
          child: ProductCard(product: item, 
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsScreen()));
          }));
      },
    );
  }
}
