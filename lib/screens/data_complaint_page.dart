import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DataComplaint extends StatefulWidget {
  final String email;
  const DataComplaint({super.key, required this.email});

  @override
  DataComplaintState createState() => DataComplaintState();
}

class DataComplaintState extends State<DataComplaint> {
  @override
  void initState() {
    super.initState();
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
            CustomTextField(controller: _denRazSoc, labelText: 'Apellidos'),
            CustomTextField(controller: _denMovPla, labelText: 'Apellidos'),
            CustomTextField(controller: _denEvi, labelText: 'Apellidos'),
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
        'usrEma': widget.email,
      };
      var response =
          await ApiService().postData('http://10.0.2.2:3000/getUser', data);

      if (response.statusCode == 200) {
        usrDNI = response.data['user']['usrDNI'];
        tz.initializeTimeZones();
        tz.setLocalLocation(tz.getLocation('America/Lima'));
        DateTime now = tz.TZDateTime.now(tz.local);
        _denFec.text = DateFormat('yyyy-MM-dd').format(now);
        _denHor.text = DateFormat('kk:mm').format(now);
        setState(() {});
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
