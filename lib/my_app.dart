import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/app/navigation/main_navigation_screen.dart';
import 'package:haat_e_commerce/core/theme/text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(useMaterial3: true, textTheme: AppTextTheme.textTheme()),
      home: MultiBlocProvider(
        providers: [
        
          BlocProvider(create: (_) => MainNavigationCubit()),
        ],
        child: MainNavigationScreen(),
      ),
    );
  }
}
