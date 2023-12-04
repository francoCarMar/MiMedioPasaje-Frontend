import 'package:flutter/material.dart';

class StatusIconHelper {
  static Icon getIconForStatus(String status) {
    status = status.toLowerCase();
    if (status.contains('aprobado')) {
      return const Icon(Icons.check_circle, color: Colors.green);
    } else if (status.contains('rechazado')) {
      return const Icon(Icons.cancel, color: Colors.red);
    } else if (status.contains('en proceso')) {
      return const Icon(Icons.hourglass_empty, color: Colors.orange);
    } else if (status.contains('enviado')) {
      return const Icon(Icons.send, color: Colors.blue);
    } else {
      return const Icon(Icons.help, color: Colors.grey);
    }
  }
}
