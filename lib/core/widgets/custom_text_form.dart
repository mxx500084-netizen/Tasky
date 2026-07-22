import 'package:flutter/material.dart';
import 'package:to_do/core/constants/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller1;
  final FormFieldValidator<String?>? validator;
  final Color color;
  final int maxLines;
  final String text;

  const CustomTextForm({
    super.key,
    required this.controller1,
    required this.validator,
    required this.color,
    this.maxLines = 1,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller1,
      maxLines: maxLines,
      style: TextStyle(color: color),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: text,
        filled: true,
        fillColor: AppColors.cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
