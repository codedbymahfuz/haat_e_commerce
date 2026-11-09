import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class TermsAndPolicy extends StatefulWidget {
  final ValueChanged<bool> onTermsChanged;

  const TermsAndPolicy({super.key, required this.onTermsChanged});

  @override
  State<TermsAndPolicy> createState() => _TermsAndPolicyState();
}

class _TermsAndPolicyState extends State<TermsAndPolicy> {
  bool isTermsAccepted = false;

  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        debugPrint('Terms & Conditions Clicked!');
      };

    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        debugPrint('Privacy Policy Clicked!');
      };
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Row(
      children: [
        Checkbox(
          value: isTermsAccepted, 
          activeColor: AppColors.accent,
          checkColor: AppColors.primary,
          side: BorderSide(color: AppColors.grey),
          onChanged: (value) {
            final newValue = value ?? false; 
            setState(() {
              isTermsAccepted = newValue;
            });

            widget.onTermsChanged(newValue);
          },
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'I agree to the ', style: theme.headlineLarge),

                TextSpan(
                  text: 'Terms ',
                  style: theme.headlineSmall?.copyWith(fontSize: 13),
                  recognizer: _termsRecognizer,
                ),

                TextSpan(text: 'and ', style: theme.headlineLarge),

                TextSpan(
                  text: 'Privacy Policy',
                  style: theme.headlineSmall?.copyWith(fontSize: 13),
                  recognizer: _privacyRecognizer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
