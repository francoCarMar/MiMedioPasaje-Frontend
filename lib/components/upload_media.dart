import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mi_medio_pasaje/helpers/dialog_helper.dart';
import 'package:mi_medio_pasaje/services/file_picker_service.dart';

class UploadMediaPicker extends StatefulWidget {
  final Function(String) onFilePicked;
  final String filePath;

  UploadMediaPicker({required this.onFilePicked, this.filePath = ''});

  @override
  _UploadMediaPickerState createState() => _UploadMediaPickerState();
}

class _UploadMediaPickerState extends State<UploadMediaPicker> {
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _filePath = widget.filePath;
  }

  Future<void> _pickFile() async {
    try {
      {
        // Lógica para seleccionar y subir otro video
        DialogUtils.showLoadingDialog(context);
        final newVideoPath = await FilePickerService.pickVideo();
        Navigator.pop(context);

        if (newVideoPath != null) {
          setState(() {
            _filePath = newVideoPath;
          });
        } else {
          print('No se seleccionó ningún video');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: TextEditingController(text: _filePath),
          enabled: false,
          decoration: const InputDecoration(
            labelText: 'Ruta del archivo',
          ),
        ),
        ElevatedButton(
          onPressed: _pickFile,
          child: const Text('Seleccionar archivo'),
        ),
      ],
    );
  }
}
