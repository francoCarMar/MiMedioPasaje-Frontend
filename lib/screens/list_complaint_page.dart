import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/upload_media.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';
import 'package:mi_medio_pasaje/services/cloudinary_service.dart';
import 'package:mi_medio_pasaje/helpers/data_time_helper.dart';

class ListComplaint extends StatefulWidget {
  const ListComplaint({super.key});

  @override
  ListComplaintState createState() => ListComplaintState();
}

class ListComplaintState extends State<ListComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denunciar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  Future<bool> _getComplaints() async {
    try {
      String usrDNI = UserHelper.getUser(context).usrDNI;
      Map<String, dynamic> data = {
        'usrDNI': usrDNI,
      };
      var response = await ApiService().postData(
          'https://mimediopasaje-backend.onrender.com/denuncias', data);

      if (response.statusCode == 200) {
        print(response);
        return true;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception('Error');
    }
  }
}
