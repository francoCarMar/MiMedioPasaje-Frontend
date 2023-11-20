import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';

class NewComplaintVideoPage extends StatelessWidget {
  final String Email;

  const NewComplaintVideoPage({super.key, required this.Email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denuncias'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Grabar'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Adjuntar data'),
            ),
          ],
        ),
      ),
    );
  }
}
