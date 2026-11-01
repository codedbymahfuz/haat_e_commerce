import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/empty_cart.png',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 15),

          Text('Your cart is empty', style: theme.titleLarge),

          const SizedBox(height: 5),

          Text(
            'Add product you like and they wii show up here',
            style: theme.titleSmall?.copyWith(fontSize: 14),
          ),

          const SizedBox(height: 18),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: PrimaryButton(
              title: 'Start shopping',
              onTap: () {
                context.read<MainNavigationCubit>().changeTabAndCategory(
                  1,
                  'all',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
