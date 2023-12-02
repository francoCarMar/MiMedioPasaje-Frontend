import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';
import 'package:mi_medio_pasaje/screens/register_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Medio Pasaje'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue], // Blanco a Azul
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo de la aplicación
              const FlutterLogo(
                size: 100.0, // Ajusta el tamaño según tus necesidades
              ),
              const SizedBox(height: 20.0), // Espaciador

              // Título y subtexto
              const Text(
                'Bienvenido a Mi Medio Pasaje',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tu aplicación para gestionar tu medio de transporte.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30.0), // Espaciador

              // Botones de navegación
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Iniciar Sesión'),
              ),
              const SizedBox(height: 10.0), // Espaciador
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
