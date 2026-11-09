import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/profile_stats_section.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/user_profile_header.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/settings_section.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            UserProfileHeader(),

            const SizedBox(height: 20),

            ProfileStatsSection(),

             const SizedBox(height: 5),

            SettingsSection(),

            const SizedBox(height: 20),

            PrimaryButton(
              title: 'Sign out',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, 
                '/login', (route)=> false);
              },

            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
