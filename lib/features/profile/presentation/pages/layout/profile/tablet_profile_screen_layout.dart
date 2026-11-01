import 'package:flutter/material.dart';
import 'package:haat_e_commerce/features/profile/presentation/pages/widgets/profile_screen_content.dart';

class TabletProfileScreenLayout extends StatelessWidget {
  const TabletProfileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(constraints: BoxConstraints(
          maxWidth: 500
        ), child: ProfileScreenContent(),),
      );
  }
}