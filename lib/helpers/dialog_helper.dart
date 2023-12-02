// dialog_utils.dart
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Seleccionando y subiendo el video...'),
            ],
          ),
        );
      },
    );
  }
}
