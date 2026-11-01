import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/responsive/responsive_layout.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/layout/profile/desktop_profile_screen_layout.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/layout/profile/mobile_profile_screen_layout.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/layout/profile/tablet_profile_screen_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileProfileScreenLayout(),
      tablet: TabletProfileScreenLayout(),
      desktop: DesktopProfileScreenLayout(),
    );
  }
}
