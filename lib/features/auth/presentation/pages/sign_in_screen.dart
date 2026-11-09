import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/responsive/responsive_layout.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/login/desktop_sign_in_screen.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/login/mobile_sign_in_screen.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/login/tablet_sign_in_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveLayout(
        mobile: MobileSignInScreen(),
        tablet: TabletSignInScreen(),
        desktop: DesktopSignInScreen(),
        ),
    );
  }

 
}
