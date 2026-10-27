import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/widgets/product_card.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';
import 'package:haat_e_commerce/features/product/presentation/pages/product_details_screen.dart';


class HomeFlashDealsSection extends StatelessWidget {
  final void Function() onPressed;
  const HomeFlashDealsSection({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Flash deals', style: theme.headlineMedium),

            TextButton(
              onPressed: onPressed,
              child: Text('See All', style: theme.headlineSmall),
            ),
          ],
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return SizedBox(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ProductCard(
                    product: item,
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsScreen()));
                    }
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
