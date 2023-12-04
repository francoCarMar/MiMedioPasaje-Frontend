import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nombre(s): ${UserHelper.getUser(context).usrNom}'),
            Text('Apellido(s): ${UserHelper.getUser(context).usrApe}'),
            Text('Email: ${UserHelper.getUser(context).usrEma}'),
            Text('DNI: ${UserHelper.getUser(context).usrDNI}'),
          ],
        ),
      ),
    );
  }
}
