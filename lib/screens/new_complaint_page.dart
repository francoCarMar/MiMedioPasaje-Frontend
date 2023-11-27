import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/camera_page.dart';
import 'package:mi_medio_pasaje/screens/data_complaint_page.dart';

class NewComplaint extends StatelessWidget {
  const NewComplaint({super.key});
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraPage()));
              },
              child: const Text('Grabar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataComplaint(),
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
