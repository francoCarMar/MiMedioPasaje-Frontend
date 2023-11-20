import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Mi Medio Pasaje'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Mis Denuncias'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sobre nosotros'),
            onTap: () {},
          ),
          InkWell(
            child: const ListTile(
              title: Text('Cerrar sesión'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),

          // Agregar más ListTile para más opciones
        ],
      ),
    );
  }
}
