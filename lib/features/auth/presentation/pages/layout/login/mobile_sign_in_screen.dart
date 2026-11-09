import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/sign_in_content.dart';

class MobileSignInScreen extends StatelessWidget {
  
  const MobileSignInScreen({super.key,});

  @override
  Widget build(BuildContext context) {

     
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100),
        
            SignInContent(),
          ],
        ),
      ),
    );
  }
}