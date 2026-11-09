import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_state.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class SizeListSection extends StatefulWidget {
  const SizeListSection({super.key});

  @override
  State<SizeListSection> createState() => _SizeListSectionState();
}

class _SizeListSectionState extends State<SizeListSection> {
 
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

  int selectSize = 0;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return BlocBuilder<MainNavigationCubit, MainNavigationState>(
      builder: (context, state) {
        final category = state.selectedCategory.toLowerCase().trim();

        if (category == 'fashion') {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Size', style: theme.titleMedium?.copyWith(fontSize: 15)),
              const SizedBox(height: 10),
              _buildSizeListView(theme), 
              const SizedBox(height: 10),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

 
  Widget _buildSizeListView(TextTheme theme) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: sizeList.length,
        itemBuilder: (context, index) {
          final sizeItem = sizeList[index];
          final selected = selectSize == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectSize = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: selected ? AppColors.softGreen : AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selected ? AppColors.accent : AppColors.border,
                  ),
                ),
                child: Center(
                  child: Text(
                    sizeItem,
                    style: theme.labelMedium?.copyWith(
                      fontSize: 13,
                      color: selected ? AppColors.accent : AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}