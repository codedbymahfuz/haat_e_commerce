import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/text_theme.dart';
import 'package:haat_e_commerce/features/home/presentation/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        useMaterial3: true,
        textTheme: AppTextTheme.textTheme(),
      ),
      home: HomeScreen(),
    );
  }
}