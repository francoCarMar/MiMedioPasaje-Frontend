import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/home_page.dart';

class ConfirmationDialog extends Dialog {
  final bool isSuccess;

  ConfirmationDialog({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(0.5),
      content: GestureDetector(
        onTap: isSuccess
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            : null,
        child: Column(
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
      ),
    );
  }
}
