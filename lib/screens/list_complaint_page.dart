import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/helpers/status_icon_helper.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/models/denuncia_model.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';

class ListComplaint extends StatefulWidget {
  List<Denuncia> _denuncias = [];
  ListComplaint({super.key});

  @override
  ListComplaintState createState() => ListComplaintState();
}

class ListComplaintState extends State<ListComplaint> {
  List<Denuncia> _denuncias = [];

  @override
  void initState() {
    super.initState();
    _getComplaints();
  }

  Future<void> _getComplaints() async {
    try {
      String usrDNI = UserHelper.getUser(context).usrDNI;
      Map<String, dynamic> data = {
        'usrDNI': usrDNI,
      };
      var response = await ApiService().postData(
          'https://mimediopasaje-backend.onrender.com/denuncias', data);

      if (response.statusCode == 200) {
        print(response.data['denuncias']);
        setState(() {
          _denuncias = Denuncia.fromJsonList(
              List<Map<String, dynamic>>.from(response.data['denuncias']));
        });
      } else {
        throw Exception('Error al obtener las denuncias');
      }
    } catch (e) {
      print('Error al cargar las denuncias: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar las denuncias')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Denuncias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _denuncias.length,
          itemBuilder: (context, index) {
            final denuncia = _denuncias[index];
            return ListTile(
              title: Text(denuncia.denRazSoc),
              subtitle: Text(denuncia.denEst),
              trailing: StatusIconHelper.getIconForStatus(denuncia.denEst),
            );
          },
        ),
      ),
    );
  }
}
