import 'package:cloudinary_public/cloudinary_public.dart';

Future<String> subirACloudinary(String rutaArchivo) async {
  final cloudinary = CloudinaryPublic('dtiztkeb5', 'k4yte9k9', cache: false);
  CloudinaryResponse respuesta = await cloudinary.uploadFile(
    CloudinaryFile.fromFile(rutaArchivo,
        resourceType: CloudinaryResourceType.Video),
  );
  return respuesta.secureUrl;
}
