import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haat_e_commerce/app/navigation/main_navigation_screen.dart';
import 'package:haat_e_commerce/core/helpers/animated_message.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';
import 'package:haat_e_commerce/core/utils/validation/validator.dart';
import 'package:haat_e_commerce/core/widgets/primary_button.dart';
import 'package:haat_e_commerce/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:haat_e_commerce/features/auth/presentation/widgets/login_text_field.dart';

class SignInContent extends StatefulWidget {
  const SignInContent({super.key});

  @override
  State<SignInContent> createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late final TapGestureRecognizer _signUpRecognizer;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SignUpScreen()),
        );
      };
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Welcome to Haat', style: theme.titleLarge),

              const SizedBox(height: 7),

              Text(
                'Sign in to track orders and save favourites',
                style: theme.headlineLarge,
              ),

              const SizedBox(height: 15),

              AuthTextField(
                hintText: 'codedby@gmail.com',
                icon: Icons.email,
                controller: _emailController,
                validator: (value) =>
                    ValidatorTextField.emailValidCheck(email: value),
              ),

              const SizedBox(height: 10),

              AuthTextField(
                hintText: '@fluttermahfuz',
                icon: Icons.lock,
                showVisibilityToggle: true,
                controller: _passwordController,
                validator: (value) =>
                    ValidatorTextField.passwordValidCheck(password: value),
              ),

              const SizedBox(height: 18),

              PrimaryButton(
                title: 'Sign in',
                onTap: () {
                  if (!_globalKey.currentState!.validate()) {
                    return;
                  }

                  AnimatedMessage.show(
                    context,
                    message: 'Login Done',
                    textStyle: theme.headlineSmall,
                    icon: Icon(Icons.done, color: AppColors.accent, size: 25),
                  );

                  _clearTextField();
                },
              ),

              const SizedBox(height: 15),

              PrimaryButton(
                title: 'Continue as guest',
                buttonColor: AppColors.softGreen,
                textStyle: theme.headlineSmall,
                border: Border.all(color: Colors.transparent),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => MainNavigationScreen()),
                    (route) => false,
                  );
                },
              ),

              const SizedBox(height: 15),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'New to Haat? ', style: theme.labelMedium),

                      TextSpan(
                        text: 'Create account',
                        style: theme.headlineSmall,
                        recognizer: _signUpRecognizer,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearTextField() {
    _emailController.clear();
    _passwordController.clear();
  }
}
