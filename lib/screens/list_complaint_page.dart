import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';
import 'package:mi_medio_pasaje/helpers/status_icon_helper.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/models/denuncia_model.dart';
import 'package:mi_medio_pasaje/screens/loading_screen_page.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';

class ListComplaint extends StatefulWidget {
  List<Denuncia> _denuncias = [];
  ListComplaint({super.key});

  @override
  ListComplaintState createState() => ListComplaintState();
}

class ListComplaintState extends State<ListComplaint> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _getComplaints();
  }

  Future<void> _getComplaints() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String usrDNI = UserHelper.getUser(context).usrDNI;
      Map<String, dynamic> data = {
        'usrDNI': usrDNI,
      };
      var response = await ApiService().postData(
          'https://mimediopasaje-backend.onrender.com/denuncias', data);

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        print(response.data['denuncias']);
        setState(() {
          widget._denuncias = Denuncia.fromJsonList(
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
    widget._denuncias.sort((a, b) => b.denFec.compareTo(a.denFec));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Denuncias'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
              ? const LoadingScreen()
              : ListView.builder(
                  itemCount: widget._denuncias.length,
                  itemBuilder: (context, index) {
                    final denuncia = widget._denuncias[index];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Mensaje de Estado'),
                              content: Text(denuncia.denMsjEst),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cerrar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(denuncia.denRazSoc),
                        subtitle: Text(denuncia.denEst),
                        trailing:
                            StatusIconHelper.getIconForStatus(denuncia.denEst),
                      ),
                    );
                  },
                )),
      drawer: const NavigatorDrawer(),
    );
  }
}
