import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hint, required this.controller, this.isSecure});
  final TextEditingController controller;
  final String hint;
  final bool? isSecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: (input) {
          if (controller.text.isEmpty) {
            return 'Field cannot be empty';
          } else {
            return null;
          }
        },
        obscureText: isSecure ?? false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
