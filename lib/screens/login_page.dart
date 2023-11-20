import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/password_textfield.dart';
import 'package:mi_medio_pasaje/screens/home_page.dart';
import 'package:mi_medio_pasaje/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final Dio _dio = Dio();

  final Map<String, dynamic> _controllers = {
    'Email': TextEditingController(),
    'Password': TextEditingController(),
  };

  final Map<String, dynamic> _errors = {
    'Email': '',
    'Password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(
                controller: _controllers['Email'],
                labelText: 'Email',
                errorText: _errors['Email']),
            PasswordTextField(
                controller: _controllers['Password'],
                errorText: _errors['Password']),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('REGISTRARSE'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('INGRESAR'),
                  onPressed: () async {
                    if (await _login()) {
                      if (!context.mounted) return;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _login() async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:3000/login',
        data: {
          'usrEma': _controllers['Email'].text,
          'usrPas': _controllers['Password'].text,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final bool access = responseData['access'];
        print(access);
        _errors['Email'] = '';
        _errors['Password'] = '';
        if (!access) {
          final String error = responseData['message'];
          print(error);
          _errors[error] = "Invalid $error";
          _controllers[error].text = '';
        }
        setState(() {});
        return access;
      } else {
        throw Exception('Error al iniciar sesión');
      }
    } catch (e) {
      print('Ocurrió un error: $e');
      return false;
    }
  }
}
