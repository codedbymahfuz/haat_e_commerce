import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/cart_count.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';

class CartActionSection extends StatefulWidget {
  const CartActionSection({super.key});

  @override
  State<CartActionSection> createState() => _CartActionSectionState();
}

class _CartActionSectionState extends State<CartActionSection> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 63,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            CartCount(
              onTapRemove: () {
                if (count > 1) {
                  setState(() {
                    count--;
                  });
                }
              },
              countItem: count.toString(),
              onTapIncrease: () {
                setState(() {
                  count++;
                });
              },
            ),
            
            const SizedBox(width: 12),
            
            Expanded(
              
              child: PrimaryButton(title: 'Add - ৳${count * 3290}'),
            ),
          ],
        ),
      ),
    );
  }
}
