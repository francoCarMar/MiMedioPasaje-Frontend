import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            const Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Información del Usuario',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text('Nombre(s):',
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(UserHelper.getUser(context).usrNom,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            ListTile(
              title: Text('Apellido(s):',
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(UserHelper.getUser(context).usrApe,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            ListTile(
              title: Text('Email:',
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(UserHelper.getUser(context).usrEma,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            ListTile(
              title:
                  Text('DNI:', style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(UserHelper.getUser(context).usrDNI,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}
