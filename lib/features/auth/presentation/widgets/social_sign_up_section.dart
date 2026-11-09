import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class SocialSignUpSection extends StatefulWidget {
  const SocialSignUpSection({super.key});

  @override
  State<SocialSignUpSection> createState() => _SocialSignUpSectionState();
}

class _SocialSignUpSectionState extends State<SocialSignUpSection> {
  late final TapGestureRecognizer _loginRecognizer;

  @override
  void initState() {
    super.initState();
    _loginRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, '/login');
      };
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.grey, indent: 12)),

            const SizedBox(width: 8),

            Text('or sign up with', style: theme.labelMedium),

            const SizedBox(width: 8),

            Expanded(child: Divider(color: AppColors.grey, endIndent: 12)),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                theme: theme,
                title: 'Google',
                onTap: () => debugPrint('Google button Click'),
              ),
            ),

            Expanded(
              child: _buildSocialButton(
                theme: theme,
                title: 'Facebook',
                onTap: () => debugPrint('Facebook button Click'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        _buildSignInText(theme),
      ],
    );
  }

  Widget _buildSocialButton({
    required TextTheme theme,
    required String title,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.softGreen,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Center(child: Text(title, style: theme.headlineSmall)),
        ),
      ),
    );
  }

  Widget _buildSignInText(TextTheme theme) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: theme.headlineLarge,
          ),

          TextSpan(
            text: 'Sign in',
            style: theme.headlineSmall?.copyWith(fontSize: 13),
            recognizer: _loginRecognizer,
          ),
        ],
      ),
    );
  }
}
