import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/services/camera_gallery_service.dart';

class UploadFileComponent extends StatefulWidget {
  final ValueChanged<String> onFileSelected;
  final String label;

  const UploadFileComponent(
      {super.key, required this.onFileSelected, required this.label});
  _UploadFileComponentState createState() => _UploadFileComponentState();
}

class _UploadFileComponentState extends State<UploadFileComponent> {
  String _filePath = '';
  final CameraGalleryService service = CameraGalleryService();

  void _pickFile() async {
    String? filePath = await service.selectPhoto();

    if (filePath != null && filePath != _filePath) {
      String fileName = filePath.split('/').last;
      setState(() {
        _filePath = fileName;
      });
      widget.onFileSelected(filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: TextEditingController()..text = _filePath,
          readOnly: true,
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: _pickFile,
            ),
          ),
        ),
      ],
    );
  }
}
