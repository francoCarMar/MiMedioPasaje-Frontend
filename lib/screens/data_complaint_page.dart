import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/upload_media.dart';
import 'package:mi_medio_pasaje/helpers/email_helper.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';
import 'package:mi_medio_pasaje/services/cloudinary_service.dart';
import 'package:mi_medio_pasaje/helpers/data_time_helper.dart';
import 'package:mi_medio_pasaje/helpers/dialog_helper.dart';

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
    _denEvi.text = widget.pathEvi;
  }

  final _denRazSoc = TextEditingController();
  final _denMovPla = TextEditingController();
  final _denFec = TextEditingController();
  final _denHor = TextEditingController();
  final _denEvi = TextEditingController();
  String usrDNI = '';
  String usrApe = '';
  String usrNom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
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
                  print("Path: $path");
                },
                label: "Adjuntar evidencia"),
            ElevatedButton(
              onPressed: () async {
                if (await _getUser() && await _complaint()) {
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

  Future<bool> _getUser() async {
    try {
      Map<String, dynamic> data = {
        'usrEma': EmailHelper.getEmail(context),
      };
      var response = await ApiService()
          .postData('https://mimediopasaje-backend.onrender.com/getUser', data);

      if (response.statusCode == 200) {
        usrDNI = response.data['user']['usrDNI'];
        usrApe = response.data['user']['usrApe'];
        usrNom = response.data['user']['usrNom'];
        return true;
      } else {
        throw Exception('Error al enviar la denuncia');
      }
    } catch (e) {
      throw Exception('Error al enviar la denuncia');
    }
  }

  Future<bool> _complaint() async {
    try {
      String url;
      DialogUtils.showLoadingDialog(context);
      url = await uploadCloudinary(_denEvi.text);
      Navigator.pop(context);

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
