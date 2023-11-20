import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
      ),
      body: const Center(
        child: Text('Bienvenido a la página principal'),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}
