import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';
import 'package:mi_medio_pasaje/screens/new_complaint_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewComplaint(),
              ),
            );
          },
          child: const Text('Nueva Queja'),
        ),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}
