import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';
import 'package:mi_medio_pasaje/screens/register_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Medio Pasaje'),
      ),
      body: Container(
        decoration: BoxDecoration(
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
              FlutterLogo(
                size: 100.0, // Ajusta el tamaño según tus necesidades
              ),
              SizedBox(height: 20.0), // Espaciador

              // Título y subtexto
              Text(
                'Bienvenido a Mi Medio Pasaje',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tu aplicación para gestionar tu medio de transporte.',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30.0), // Espaciador

              // Botones de navegación
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Iniciar Sesión'),
              ),
              SizedBox(height: 10.0), // Espaciador
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
