import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';
import 'package:mi_medio_pasaje/screens/new_complaint_page.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});
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
                builder: (context) => NewComplaint(email: email),
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
