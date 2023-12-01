import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerService {
  static Future<String?> pickVideo() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mov', 'avi'], // Puedes ajustar las extensiones permitidas
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        return file.path; // Devuelve la ruta local del video
      }

      return null;
    } catch (e) {
      print('Error al seleccionar el video: $e');
      return null;
    }
  }
}

