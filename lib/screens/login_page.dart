import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/custom_textfield.dart';
import 'package:mi_medio_pasaje/components/password_textfield.dart';
import 'package:mi_medio_pasaje/helpers/user_helper.dart';
import 'package:mi_medio_pasaje/models/user_model.dart';
import 'package:mi_medio_pasaje/screens/home_page.dart';
import 'package:mi_medio_pasaje/screens/loading_screen_page.dart';
import 'package:mi_medio_pasaje/screens/register_page.dart';
import 'package:mi_medio_pasaje/services/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final Map<String, dynamic> _controllers = {
    'Email': TextEditingController(),
    'Password': TextEditingController(),
  };

  final Map<String, dynamic> _errors = {
    'Email': '',
    'Password': '',
  };
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión',
            style: textStyles.headlineMedium
                ?.copyWith(color: colorScheme.onPrimary)),
        backgroundColor: colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'lib/assets/logo.png',
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _controllers['Email'],
                  labelText: 'Email',
                  errorText: _errors['Email']),
              const SizedBox(height: 10),
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
                  ValueListenableBuilder(
                    valueListenable: _controllers['Email'],
                    builder: (context, _, __) => ValueListenableBuilder(
                      valueListenable: _controllers['Password'],
                      builder: (context, _, __) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (_controllers['Email'].text.isNotEmpty &&
                                _controllers['Password'].text.isNotEmpty)
                            ? () async {
                                FocusScope.of(context).unfocus();
                                if (await _login()) {
                                  if (!context.mounted) return;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              }
                            : null,
                        child: const Text('INGRESAR',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
              if (_isLoading) const LoadingScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Map<String, dynamic> data = {
        'usrEma': _controllers['Email'].text,
        'usrPas': _controllers['Password'].text,
      };
      final response = await ApiService()
          .postData('https://mimediopasaje-backend.onrender.com/login', data)
          .timeout(Duration(seconds: 12));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final bool access = responseData['access'];

        setState(() {
          _isLoading = false;
        });

        _errors['Email'] = '';
        _errors['Password'] = '';
        if (!access) {
          final String error = responseData['message'];
          print(error);
          _errors[error] = "$error invalido";
          _controllers[error].text = '';
          return false;
        }

        final User user = User.fromJsonMap(responseData['user']);
        _updateUser(user);
        return true;
      } else {
        throw Exception('Error al iniciar sesión');
      }
    } on TimeoutException catch (_) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No hay conexión')),
      );
      return false;
    } catch (e) {
      print('Ocurrió un error: $e');
      return false;
    }
  }

  void _updateUser(User user) {
    UserHelper.setUser(context, user);
  }
}
