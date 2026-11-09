import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/helpers/animated_message.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/utils/validation/validator.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/login_text_field.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/social_sign_up_section.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/terms_and_policy.dart';

class SignUpContent extends StatefulWidget {
  const SignUpContent({super.key});

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isTermsAccepted = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create account', style: theme.titleLarge),

            const SizedBox(height: 7),

            Text(
              'Join Haat for faster checkout and order tracking',
              style: theme.headlineLarge,
              maxLines: 2,
            ),

            const SizedBox(height: 15),

            AuthTextField(
              hintText: 'Full name',
              controller: _fullNameController,
              validator: (value) =>
                  ValidatorTextField.validNameCheck(name: value),
            ),

            const SizedBox(height: 7),

            AuthTextField(
              hintText: 'Phone number',
              controller: _phoneNumberController,
              keyboardType: TextInputType.number,
              validator: (value) =>
                  ValidatorTextField.validNumberCheck(phone: value),
            ),

            const SizedBox(height: 7),

            AuthTextField(
              hintText: 'Email',
              controller: _emailController,
              validator: (value) =>
                  ValidatorTextField.emailValidCheck(email: value),
            ),

            const SizedBox(height: 7),

            AuthTextField(
              hintText: 'Password (min 6 characters)',
              showVisibilityToggle: true,
              controller: _passwordController,
              validator: (value) =>
                  ValidatorTextField.passwordValidCheck(password: value),
            ),

            const SizedBox(height: 7),

            TermsAndPolicy(
              onTermsChanged: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              },
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              title: 'Create account',
              onTap: () {
                if (!_globalKey.currentState!.validate()) {
                  return;
                }

                if (!isTermsAccepted) {
                  AnimatedMessage.show(
                    context,
                    message: 'Terms option select please',
                    textStyle: theme.headlineSmall?.copyWith(
                      color: AppColors.redColor,
                    ),
                    icon: Icon(Icons.error, color: AppColors.redColor),
                  );
                }


              },
            ),

            const SizedBox(height: 20),

            SocialSignUpSection(),
          ],
        ),
      ),
    );
  }

  // void _clearTextField() {
  //   _fullNameController.clear();
  //   _phoneNumberController.clear();
  //   _emailController.clear();
  //   _passwordController.clear();
  // }
}
