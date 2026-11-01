import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            color: AppColors.softGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Color(0xFF6B7C77), size: 35),
        ),
        const SizedBox(height: 10),
        Text('Mahfuzur Rahman', style: theme.titleLarge),
        const SizedBox(height: 5),
        Text(
          'codedbymahfuz@gmail.com',
          style: theme.labelMedium?.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
