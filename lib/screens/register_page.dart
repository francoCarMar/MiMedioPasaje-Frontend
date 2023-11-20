import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/password_textfield.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _dniController = TextEditingController();
  final _passController = TextEditingController();
  final _imgCarnetController = TextEditingController();
  final _imgDNIController = TextEditingController();

  final Map<String, dynamic> _errors = {
    'DNI': '',
    'Email': '',
  };

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
                controller: _emailController,
                labelText: 'Email',
                errorText: _errors['Email']),
            CustomTextField(controller: _nameController, labelText: 'Nombres'),
            CustomTextField(
                controller: _lNameController, labelText: 'Apellidos'),
            CustomTextField(
                controller: _dniController,
                labelText: 'Número de DNI',
                errorText: _errors['DNI']),
            PasswordTextField(controller: _passController),
            CustomTextField(
                controller: _imgDNIController, labelText: 'Imagen del DNI'),
            CustomTextField(
                controller: _imgCarnetController,
                labelText: 'Imagen del Carnet Universitario'),
            ElevatedButton(
              onPressed: () async {
                if (await _register()) {
                  if (!context.mounted) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  final Dio _dio = Dio();

  Future<bool> _register() async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:3000/register', // Reemplaza con la URL de tu API
        data: {
          'usrDNI': _dniController.text,
          'usrNom': _nameController.text,
          'usrApe': _lNameController.text,
          'usrEma': _emailController.text,
          'usrPas': _passController.text,
          'usrImgCar': _imgCarnetController.text,
          'usrImgDNI': _imgDNIController.text,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final bool registered = responseData['registered'];
        print(registered);
        _errors['DNI'] = '';
        _errors['Email'] = '';
        if (!registered) {
          print(responseData['message']);
          setState(() {
            List<String> errors = responseData['message'].split(',');
            for (String i in errors) {
              _errors[i] = 'El $i ya existe';
            }
          });
        }
        return registered;
      } else {
        throw Exception('Error al iniciar sesión');
      }
    } catch (e) {
      print('Ocurrió un error: $e');
      return false;
    }
  }
}
