import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/profile_stats_section.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/user_profile_header.dart';

class DesktopProfileScreenLayout extends StatelessWidget {
  const DesktopProfileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          color: AppColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [SizedBox(height: 30), _ProfileSidebarMenu()],
          ),
        ),

        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const UserProfileHeader(),
              const SizedBox(height: 25),
              const SizedBox(width: 700, child: ProfileStatsSection()),
              const SizedBox(height: 100),
              SizedBox(width: 350, child: PrimaryButton(title: 'Sign out')),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileSidebarMenu extends StatelessWidget {
  const _ProfileSidebarMenu();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _buildSidebarItem(
          onTap: () {},
          title: 'My orders',
          icon: Icons.shopping_bag_outlined,
          textTheme: textTheme,
        ),
        _customDivider(),
        _buildSidebarItem(
          onTap: () {},
          title: 'Saved addresses',
          icon: Icons.location_on_outlined,
          textTheme: textTheme,
        ),
        _customDivider(),
        _buildSidebarItem(
          onTap: () {},
          title: 'Payment method',
          icon: Icons.payment_outlined,
          textTheme: textTheme,
        ),
        _customDivider(),
        _buildSidebarItem(
          onTap: () {},
          title: 'Dark mode',
          icon: Icons.dark_mode_outlined,
          textTheme: textTheme,
        ),
        _customDivider(),
        _buildSidebarItem(
          onTap: () {},
          title: 'Help & support',
          icon: Icons.help_outline,
          textTheme: textTheme,
        ),
        _customDivider(),
      ],
    );
  }

  Widget _customDivider() {
    return Divider(indent: 15, endIndent: 25, color: Colors.grey.shade200);
  }

  Widget _buildSidebarItem({
    required VoidCallback onTap,
    required String title,
    required IconData icon,
    required TextTheme textTheme,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: AppColors.subtitle),
            const SizedBox(width: 15),
            Text(title, style: textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
