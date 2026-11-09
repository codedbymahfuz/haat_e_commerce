import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/sign_up_content.dart';

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
        
            const SizedBox(height: 15),
        
            SignUpContent(),
          ],
        ),
      ),
    );
  }
}
