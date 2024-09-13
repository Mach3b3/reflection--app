import 'package:flutter/material.dart';
import 'package:term_1_reflection/assets.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged; // Define the onChanged parameter

  const TextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.onChanged, // Add onChanged parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged, // Pass onChanged to the TextFormField
      decoration: InputDecoration(
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors().grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors().border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors().primary),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
