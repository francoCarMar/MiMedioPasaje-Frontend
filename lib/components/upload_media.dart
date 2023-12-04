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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _filePath,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.file_upload),
                  onPressed: _pickFile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
