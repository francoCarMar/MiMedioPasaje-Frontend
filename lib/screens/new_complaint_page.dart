import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/data_complaint_page.dart';

class NewComplaint extends StatelessWidget {
  final String email;

  const NewComplaint({super.key, required this.email});
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataComplaint(email: email),
                  ),
                );
              },
              child: const Text('Adjuntar data'),
            ),
          ],
        ),
      ),
    );
  }
}
