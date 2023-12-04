import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/models/user_model.dart';
import 'package:mi_medio_pasaje/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class UserHelper {
  static User getUser(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    return userNotifier.user;
  }

  static void setUser(BuildContext context, User user) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    userNotifier.setUser(user);
  }
}
