import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/sign_in_content.dart';

class DesktopSignInScreen extends StatelessWidget {

  const DesktopSignInScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [SignInContent()],
            ),
          ),
        ),
      ),
    );
  }
}
