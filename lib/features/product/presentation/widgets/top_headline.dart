import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class TopHeadline extends StatefulWidget {
  const TopHeadline({super.key});

  @override
  State<TopHeadline> createState() => _TopHeadlineState();
}

class _TopHeadlineState extends State<TopHeadline> {
  bool isWishlisted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary, size: 32,),
        ),

        const SizedBox(width: 10),

        Text('Details', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20)),

        Spacer(),

        GestureDetector(
          onTap: () {
            setState(() {
              isWishlisted = !isWishlisted;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              border: BoxBorder.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              isWishlisted ? Icons.favorite: Icons.favorite_border,
              color: isWishlisted ? AppColors.redColor : AppColors.textPrimary,
              size: 27,
            ),
          ),
        ),
      ],
    );
  }
}

