import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/quantity_selector.dart';

class CartProductCard extends StatefulWidget {
  final TextTheme theme;
  final int index;
  final List<int> cartItemList;

  const CartProductCard({
    super.key,
    required this.index,
    required this.theme,
    required this.cartItemList,
  });

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _productImage(),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pulse',
                  style: widget.theme.titleSmall?.copyWith(
                    color: AppColors.accent,
                    fontSize: 14,
                  ),
                ),

                Text('Smart Watch', style: widget.theme.titleMedium),

                const SizedBox(height: 10),

                QuantitySelector(
                  onTapRemove: () {
                    if (widget.cartItemList[widget.index] > 1) {
                      setState(() {
                        widget.cartItemList[widget.index]--;
                      });
                    }
                  },
                  countItem: widget.cartItemList[widget.index].toString(),
                  onTapIncrease: () {
                    setState(() {
                      widget.cartItemList[widget.index]++;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          _deleteAndPrice(),
        ],
      ),
    );
  }

  Widget _deleteAndPrice() {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.delete,
                size: 23,
                color: AppColors.redColor,
              ),
            ),
        
            Text(
              'Tk. 500',
              style: widget.theme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold, fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
