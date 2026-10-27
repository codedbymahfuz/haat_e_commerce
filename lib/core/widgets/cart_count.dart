import 'package:flutter/material.dart';

class CartCount extends StatelessWidget {
 final void Function() onTapRemove;
 final void Function() onTapIncrease;
 final String countItem;
  const CartCount({super.key, required this.onTapRemove, required this.countItem, required this.onTapIncrease});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F6F5),
        border: Border.all(color: Color(0xFFE3EAE8)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTapRemove,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(Icons.remove, size: 18),
              ),
            ),

            const SizedBox(width: 10),

            Text(countItem),

            const SizedBox(width: 10),

            InkWell(
              onTap: onTapIncrease,
              child: Container(
                 padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.add, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}