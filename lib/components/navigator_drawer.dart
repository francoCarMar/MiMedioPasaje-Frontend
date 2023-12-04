import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/about_us_page.dart';
import 'package:mi_medio_pasaje/screens/home_page.dart';
import 'package:mi_medio_pasaje/screens/list_complaint_page.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';
import 'package:mi_medio_pasaje/screens/profile_page.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: screenHeight * 0.4,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/logo.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.6,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Mis Denuncias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListComplaint(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sobre nosotros'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text('Cerrar sesión'),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false, // Esto elimina todas las rutas anteriores.
              );
            },
          ),
        ],
      ),
    );
  }
}
