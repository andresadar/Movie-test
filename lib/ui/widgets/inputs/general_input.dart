import 'package:flutter/material.dart';

class GeneralInput extends StatelessWidget {
  const GeneralInput(
      {super.key,
      this.validator,
      required this.label,
      required this.controller});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        labelText: label,
      ),
    );
  }
}
