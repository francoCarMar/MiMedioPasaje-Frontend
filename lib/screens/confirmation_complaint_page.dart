import 'package:flutter/material.dart';

class ConfirmationDialog extends Dialog {
  final bool isSuccess;

  ConfirmationDialog({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(0.5),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color: isSuccess ? Colors.green : Colors.red,
            size: 100.0,
          ),
          Text(
            isSuccess
                ? 'Denuncia enviada correctamente'
                : 'Error al enviar la denuncia',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
