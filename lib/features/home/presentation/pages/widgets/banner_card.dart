import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_cubit.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    if (currentWidth < 600) {
      currentWidth * 0.9;
    } else if (currentWidth < 1020) {
      currentWidth * 0.3;
    } else {
      currentWidth * 0.3;
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _deatilsBannerItem(context),
        );
      },
    );
  }

  Widget _deatilsBannerItem(BuildContext context) {
    final theme = TextTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0E7C66), Color(0xFF2DBF9F)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [_bannerImage(), _buildBannerContent(theme, context)],
      ),
    );
  }

  Widget _buildBannerContent(TextTheme theme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 10),
          Text(
            'Festive sale, up to 60% off ',
            style: theme.headlineLarge?.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            maxLines: 3,
          ),

          const SizedBox(height: 10),

          Text(
            'Ends in 3 days',
            style: theme.titleSmall?.copyWith(
              color: AppColors.primary,
              fontSize: 15,
            ),
          ),

          Spacer(),

          GestureDetector(
            onTap: () {
              context.read<MainNavigationCubit>().changeTabAndCategory(
                1,
                'all',
              );
            },
            child: Container(
              height: 35,
              width: 85,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Shop now',
                  style: theme.titleMedium?.copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bannerImage() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.asset(
          'assets/icons/gift.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
