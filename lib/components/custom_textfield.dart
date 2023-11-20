import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.errorText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(errorText, style: const TextStyle(color: Colors.red))),
      ],
    );
  }
}
