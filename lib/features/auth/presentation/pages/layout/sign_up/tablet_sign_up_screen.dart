import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/sign_up_content.dart';

class TabletSignUpScreen extends StatelessWidget {
  const TabletSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: 500,
      ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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