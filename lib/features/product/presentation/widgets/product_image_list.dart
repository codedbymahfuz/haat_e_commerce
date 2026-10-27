import 'package:flutter/material.dart';

class ProductImageList extends StatelessWidget {
  final int imageList;
  final double? imageHeight;
  const ProductImageList({super.key, required this.imageList, this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight ?? 300,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemCount: imageList,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFBDE8DF),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
