// new_complaint_page.dart
import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/screens/camera_page.dart';
import 'package:mi_medio_pasaje/screens/data_complaint_page.dart';
import 'package:mi_medio_pasaje/services/file_picker_service.dart';
import 'package:mi_medio_pasaje/helpers/dialog_helper.dart';

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
                DialogUtils.showLoadingDialog(context);

                Navigator.pop(context);
                //final videoPath = await FilePickerService.pickVideo();

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
