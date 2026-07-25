import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller1;
  final FormFieldValidator<String?>? validator;

  final int maxLines;
  final String text;

  const CustomTextForm({
    super.key,
    required this.controller1,
    required this.validator,

    this.maxLines = 1,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller1,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(hintText: text),
    );
  }
}
