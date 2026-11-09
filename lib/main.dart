import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainNavigationCubit())],
      child: const MyApp(),
    ),
  );
}
