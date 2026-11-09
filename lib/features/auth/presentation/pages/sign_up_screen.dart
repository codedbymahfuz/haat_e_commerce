import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/responsive/responsive_layout.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/sign_up/desktop_sign_up_screen.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/sign_up/mobile_sign_up_screen.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/layout/sign_up/tablet_sign_up_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveLayout(
        mobile: MobileSignUpScreen(),
        tablet: TabletSignUpScreen(),
        desktop: DesktopSignUpScreen() ,

        ),
    );
  }

 

}
