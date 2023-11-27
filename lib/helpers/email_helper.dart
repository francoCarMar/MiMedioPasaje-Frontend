import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/providers/email_notifier.dart';
import 'package:provider/provider.dart';

class EmailHelper {
  static String getEmail(BuildContext context) {
    return Provider.of<EmailNotifier>(context, listen: false).email;
  }

  static void setEmail(BuildContext context, String email) {
    Provider.of<EmailNotifier>(context, listen: false).setEmail(email);
  }
}
