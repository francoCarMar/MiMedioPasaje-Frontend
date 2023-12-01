// new_complaint_page.dart
import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/camera_page.dart';
import 'package:mi_medio_pasaje/screens/data_complaint_page.dart';
import 'package:mi_medio_pasaje/services/file_picker_service.dart';
import 'package:mi_medio_pasaje/utils/dialog_utils.dart';

class NewComplaint extends StatelessWidget {
  const NewComplaint({Key? key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ),
                );
              },
              child: const Text('Grabar'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Mostrar diálogo de carga mientras selecciona y sube el video
                DialogUtils.showLoadingDialog(context);

                // Llamar a la función para seleccionar y subir el video
                final videoPath = await FilePickerService.pickVideo();

                // Cerrar el diálogo de carga
                Navigator.pop(context);

                if (videoPath != null) {
                  // Hacer algo con la ruta local del video, por ejemplo, pasarla a DataComplaint
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataComplaint(pathEvi: videoPath),
                    ),
                  );
                } else {
                  // Manejar el caso en el que no se selecciona ningún video
                  print('No se seleccionó ningún video');
                }
              },
              child: const Text('Adjuntar data'),
            ),
          ],
        ),
      ),
    );
  }
}
