import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class ProductCard extends StatefulWidget {
  final Map<String, Object> product;
  final void Function() onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  bool isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: widget.product['color'] as Color,
                      child: Icon(
                        widget.product['icon'] as IconData,
                        size: 76,
                        color: const Color(0xFF364B48),
                      ),
                    ),
      
                    _discountBadge(widget.product, theme),
      
                    _wishListButton(),
      
                    _addToCart(context, widget.product.length),
                  ],
                ),
              ),
            ),
      
            const SizedBox(height: 10),
      
            Text(
              widget.product['name'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.titleSmall?.copyWith(fontSize: 14),
            ),
      
            Text(
              widget.product['description'] as String,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.titleMedium,
            ),
      
            const SizedBox(height: 6),
      
            Text(
              '★ ${widget.product['rating']} (${widget.product['reviews']})',
              maxLines: 1,
              style: theme.titleSmall?.copyWith(fontSize: 13),
            ),
      
            Spacer(),
      
            Row(
              children: [
                Flexible(
                  child: Text(
                    widget.product['price'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium?.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    widget.product['oldPrice'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleSmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _discountBadge(Map<String, Object> product, TextTheme theme) {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.discount,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          product['discount'] as String,
          style: theme.titleMedium,
        ),
      ),
    );
  }

  Widget _wishListButton() {
    return Positioned(
      top: 10,
      right: 10,
      child: CircleAvatar(
        radius: 21,
        backgroundColor: AppColors.primary,
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 21,
          onPressed: () {

            setState(() {
              isWishlisted = !isWishlisted;
            });
           
          },
         icon: Icon(
            isWishlisted ? Icons.favorite : Icons.favorite_border, 
            color: isWishlisted ? AppColors.redColor : AppColors.textPrimary, 
          ),
        ),
      ),
    );
  }

  Widget _addToCart(BuildContext context, int index) {
    return Positioned(
      right: 10,
      bottom: 10,
      child: CircleAvatar(
        radius: 19,
        backgroundColor: AppColors.accent,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            debugPrint('Added');
          },
          icon: const Icon(Icons.add, color: AppColors.primary, size: 28),
        ),
      ),
    );
  }
}
