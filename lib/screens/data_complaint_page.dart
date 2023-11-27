import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/helpers/email_helper.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';
import 'package:mi_medio_pasaje/utils/data_time_utils.dart';

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
  final _denEvi = TextEditingController();
  String usrDNI = '';

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
                controller: _denRazSoc, labelText: 'Nombre de la empresa'),
            CustomTextField(
                controller: _denMovPla, labelText: 'Número de placa'),
            CustomTextField(controller: _denEvi, labelText: 'Evidencia'),
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
      var response =
          await ApiService().postData('http://10.0.2.2:3000/getUser', data);

      if (response.statusCode == 200) {
        usrDNI = response.data['user']['usrDNI'];
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
      Map<String, dynamic> data = {
        'usrDNI': usrDNI,
        'denRazSoc': _denRazSoc.text,
        'denFec': _denFec.text,
        'denHor': _denHor.text,
        'denMovPla': _denMovPla.text,
        'denEvi': _denEvi.text,
      };

      final response =
          await ApiService().postData('http://10.0.2.2:3000/denunciar', data);

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
