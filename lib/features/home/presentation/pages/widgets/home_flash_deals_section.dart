import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/widgets/product_card.dart';
import 'package:haat_e_commerce/core/product_list/list_map.dart';

class HomeFlashDealsSection extends StatelessWidget {
  const HomeFlashDealsSection({super.key});

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
              onPressed: () {
                debugPrint('See All Button Click');
              },
              child: Text('See All', style: theme.headlineSmall),
            ),
          ],
        ),

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
                    onTap: () => debugPrint('Select $index'),
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
