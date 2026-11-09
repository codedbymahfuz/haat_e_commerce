import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/sign_up_content.dart';

class DesktopSignUpScreen extends StatelessWidget {
  const DesktopSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: 700,
      ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
       ),
      ),
    );
  }
}