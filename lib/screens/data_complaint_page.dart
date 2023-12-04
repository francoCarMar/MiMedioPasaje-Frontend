import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/upload_media.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';
import 'package:mi_medio_pasaje/services/cloudinary_service.dart';
import 'package:mi_medio_pasaje/helpers/data_time_helper.dart';

class DataComplaint extends StatefulWidget {
  final String pathEvi;
  const DataComplaint({super.key, this.pathEvi = ''});

  @override
  DataComplaintState createState() => DataComplaintState();
}

class DataComplaintState extends State<DataComplaint> {
  @override
  void initState() {
    super.initState();
    initializeTimezone();
    _denFec.text = getCurrentDate();
    _denHor.text = getCurrentTime();
  }

  final _denRazSoc = TextEditingController();
  final _denMovPla = TextEditingController();
  final _denFec = TextEditingController();
  final _denHor = TextEditingController();
  String usrDNI = '';
  String usrApe = '';
  String usrNom = '';
  String denEvi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denunciar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: _denRazSoc,
              labelText: 'Nombre de la empresa',
            ),
            CustomTextField(
              controller: _denMovPla,
              labelText: 'Número de placa',
            ),
            UploadFileComponent(
                onFileSelected: (path) {
                  denEvi = path;
                },
                label: "Adjuntar evidencia"),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                if (await _complaint()) {
                  print("Denuncia enviada");
                }
              },
              child: const Text('Denunciar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _complaint() async {
    try {
      String usrDNI = UserHelper.getUser(context).usrDNI;
      String usrNom = UserHelper.getUser(context).usrNom;
      String usrApe = UserHelper.getUser(context).usrApe;
      String url = await uploadCloudinary(denEvi);

      Map<String, dynamic> data = {
        'usrDNI': usrDNI,
        'usrNom': usrNom,
        'usrApe': usrApe,
        'denRazSoc': _denRazSoc.text,
        'denMovPla': _denMovPla.text,
        'denFec': _denFec.text,
        'denHor': _denHor.text,
        'denEvi': url,
      };

      final response = await ApiService().postData(
          'https://mimediopasaje-backend.onrender.com/denunciar', data);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Error al denunciar');
      }
    } catch (e) {
      print('Ocurrió un error: $e');
      return false;
    }
  }
}
