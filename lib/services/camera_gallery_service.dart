import 'package:image_picker/image_picker.dart';

class CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  Future<String?> selectPhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (photo == null) return null;

    print('Tenemos una imagen ${photo.path}');

    return photo.path;
  }

  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (photo == null) return null;

    print('Tenemos una imagen ${photo.path}');

    return photo.path;
  }
}
