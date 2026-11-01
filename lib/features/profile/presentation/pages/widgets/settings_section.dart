import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _settingsOptionItem(
          onTap: () => debugPrint('My orders Click'),
          title: 'My orders',
          icon: Icons.shopping_bag_outlined,
          theme: theme,
        ),

        _settingsOptionItem(
          onTap: () => debugPrint('Saved addresses Click'),
          title: 'Saved addresses',
          icon: Icons.pin_drop,
          theme: theme,
        ),

        _settingsOptionItem(
          onTap: () => debugPrint('Payment methods Click'),
          title: 'Payment methods',
          icon: Icons.payment,
          theme: theme,
        ),

        _settingsOptionItem(
          onTap: () => debugPrint('Dark mode Click'),
          title: 'Dark mode',
          icon: Icons.mood,
          theme: theme,
        ),

        _settingsOptionItem(
          onTap: () => debugPrint('Help & support Click'),
          title: 'Help & support',
          icon: Icons.help,
          theme: theme,
        ),
      ],
    );
  }

  Widget _settingsOptionItem({
    required VoidCallback onTap,
    required String title,
    required IconData icon,
    required TextTheme theme,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),

          child: Row(
            children: [
              const SizedBox(width: 10),

              Icon(icon, color: const Color(0xFF6B7C77)),

              const SizedBox(width: 15),

              Text(title, style: theme.titleMedium),

              Spacer(),

              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.subtitle,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
