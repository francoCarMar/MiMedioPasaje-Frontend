import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';

class AboutUsPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'image': 'lib/assets/Franco.jpg', 'name': 'Franco Cárdenas'},
    {'image': 'lib/assets/Henry.png', 'name': 'Henry Galvéz'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              'Mi Medio Pasaje',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Mi Medio Pasaje es una aplicación que sirve de ayuda al pasajero'
              'universitario cuando usa el transporte público. Es un derecho el'
              'exigir que se respete el medio pasaje universitario pero aveces '
              'es complicado hacer valer este derecho, este proyecto tiene por'
              'finalidad ayudar al pasajero para que de manera fácil y práctica '
              'pueda reclamar su derecho al medio pasaje y pueda ver su respuesta de manera efectiva.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Text(
              'Nuestro Equipo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Nuestro equipo está conformado por estudiantes del curso de '
              'Construcción de Software A de la Escuela Profesional de Ingeniería '
              'de Sistemas de la UNSA',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teamMembers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(teamMembers[index]['image']!),
                      radius: 50.0,
                    ),
                    Text(
                      teamMembers[index]['name']!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}
