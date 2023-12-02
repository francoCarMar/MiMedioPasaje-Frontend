import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerService {
  static Future<String?> pickVideo() async {
    try {
      PermissionStatus status = await Permission.storage.status;

      if (!status.isGranted) {
        status = await Permission.storage.request();
      }

      if (status.isGranted) {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp4', 'mov', 'avi'],
        );

        if (result != null) {
          final file = File(result.files.single.path!);
          return file.path;
        }
      } else {
        print('Permiso de almacenamiento denegado');
      }

      return null;
    } catch (e) {
      print('Error al seleccionar el video: $e');
      return null;
    }
  }
}
