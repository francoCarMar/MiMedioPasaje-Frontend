import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> uploadCloudinary(String rutaArchivo) async {
  String cloudName = dotenv.env['CLOUD_NAME']!;
  String presetName = dotenv.env['PRESET_NAME']!;
  final cloudinary = CloudinaryPublic(cloudName, presetName, cache: false);
  CloudinaryResponse respuesta = await cloudinary.uploadFile(
    CloudinaryFile.fromFile(rutaArchivo,
        resourceType: CloudinaryResourceType.Video),
  );
  return respuesta.secureUrl;
}
