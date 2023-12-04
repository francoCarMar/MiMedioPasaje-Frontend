import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String errorText;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.errorText = "",
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Contraseña",
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          obscureText: !_isPasswordVisible,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child:
              Text(widget.errorText, style: const TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
