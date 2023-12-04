import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/password_textfield.dart';
import 'package:mi_medio_pasaje/components/upload_media.dart';
import 'package:mi_medio_pasaje/screens/loading_screen_page.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';

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

  bool _isLoading = false;

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
            UploadFileComponent(
              onFileSelected: (path) {
                _imgDNIController.text = path;
              },
              label: "Adjuntar imagen del DNI",
            ),
            const SizedBox(height: 20),
            UploadFileComponent(
              onFileSelected: (path) {
                _imgCarnetController.text = path;
              },
              label: "Adjuntar imagen del Carnet Universitario",
            ),
            const SizedBox(height: 20),
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
            if (_isLoading) const LoadingScreen(),
          ],
        ),
      ),
    );
  }

  Future<bool> _register() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Map<String, dynamic> data = {
        'usrDNI': _dniController.text,
        'usrNom': _nameController.text,
        'usrApe': _lNameController.text,
        'usrEma': _emailController.text,
        'usrPas': _passController.text,
        'usrImgCar': _imgCarnetController.text,
        'usrImgDNI': _imgDNIController.text,
      };

      final response = await ApiService().postData(
          'https://mimediopasaje-backend.onrender.com/register', data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final bool registered = responseData['registered'];
        setState(() {
          _isLoading = false;
        });
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
