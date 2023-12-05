import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/services/camera_gallery_service.dart';

class UploadFileComponent extends StatefulWidget {
  final ValueChanged<String> onFileSelected;
  final String label;
  final String pathAlternative;

  const UploadFileComponent(
      {super.key,
      required this.onFileSelected,
      required this.label,
      this.pathAlternative = ''});
  _UploadFileComponentState createState() => _UploadFileComponentState();
}

class _UploadFileComponentState extends State<UploadFileComponent> {
  String _filePath = '';
  final CameraGalleryService service = CameraGalleryService();

  void _pickFile() async {
    if (widget.pathAlternative.isNotEmpty) {
      setState(() {
        widget.onFileSelected(widget.pathAlternative);
      });
    } else {
      String? filePath = await service.selectPhoto();

      if (filePath != null && filePath != _filePath) {
        setState(() {
          _filePath = filePath;
        });
        if (_filePath.isNotEmpty) {
          widget.onFileSelected(_filePath);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: TextEditingController()
            ..text = widget.pathAlternative.isEmpty
                ? _filePath
                : widget.pathAlternative,
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
