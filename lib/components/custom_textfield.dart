import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final bool enabled;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText = "",
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Column(
      children: [
        TextField(
          enabled: enabled,
          controller: controller,
          style: textStyles.bodyMedium,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
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
