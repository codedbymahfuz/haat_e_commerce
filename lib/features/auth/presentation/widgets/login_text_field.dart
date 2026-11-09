import 'package:flutter/material.dart';
import 'package:haat_e_commerce/core/theme/app_colors.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool showVisibilityToggle;
  final bool isIconShow;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.showVisibilityToggle = false,
    this.isIconShow = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _isPasswordHidden = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.textPrimary,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.showVisibilityToggle ? _isPasswordHidden : false,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.subtitle),

        prefixIcon: widget.isIconShow
            ? null
            : (widget.icon != null
                  ? Icon(widget.icon, color: AppColors.subtitle)
                  : null),

        suffixIcon: widget.showVisibilityToggle
            ? TextButton(
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
                child: Text(
                  _isPasswordHidden ? 'Show' : 'Hide',
                  style: TextTheme.of(
                    context,
                  ).headlineSmall?.copyWith(fontSize: 13),
                ),
              )
            : null,

        filled: true,
        fillColor: AppColors.primary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: _focusNode.hasFocus ? AppColors.accent : AppColors.border,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accent, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.redColor, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.redColor, width: 1.5),
        ),

        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }
}
