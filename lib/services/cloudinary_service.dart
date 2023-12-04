import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> uploadCloudinary(String rutaArchivo) async {
  String cloudName = dotenv.env['CLOUD_NAME']!;
  String presetName = dotenv.env['PRESET_NAME']!;
  final cloudinary = CloudinaryPublic(cloudName, presetName, cache: false);

  String extension = rutaArchivo.split('.').last;
  CloudinaryResourceType resourceType = extension == 'mp4' || extension == 'mov'
      ? CloudinaryResourceType.Video
      : CloudinaryResourceType.Image;

  CloudinaryResponse respuesta = await cloudinary.uploadFile(
    CloudinaryFile.fromFile(rutaArchivo, resourceType: resourceType),
  );
  return respuesta.secureUrl;
}
