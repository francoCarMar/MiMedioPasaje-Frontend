import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mi Medio Pasaje',
            ),
            SizedBox(height: 16),
            Text(
              'Mi Medio Pasaje es una aplicación que facilita el acceso a los medios de transporte. '
              'Nuestro objetivo es proporcionar una plataforma fácil de usar que ayude a los usuarios a reclamar su medio pasaje.',
            ),
            SizedBox(height: 16),
            Text(
              'Nuestro Equipo',
            ),
            SizedBox(height: 16),
            Text(
              'Nuestro equipo está compuesto por profesionales dedicados a hacer respetar tus derechos.',
            ),
          ],
        ),
      ),
    );
  }
}
