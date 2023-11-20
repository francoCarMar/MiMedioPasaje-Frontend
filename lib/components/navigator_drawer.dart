import 'package:flutter/material.dart';

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
            title: const Text('Opción 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Opción 2'),
            onTap: () {},
          ),
          // Agregar más ListTile para más opciones
        ],
      ),
    );
  }
}
