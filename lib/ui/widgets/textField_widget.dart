import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const TextFieldWidget({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x4D2196F3), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x4D2196F3), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
