import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/config/theme/app_theme.dart';
import 'package:mi_medio_pasaje/providers/user_notifier.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mi_medio_pasaje/screens/login_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserNotifier(),
      child: MaterialApp(
        title: 'Mi Medio Pasaje',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const LoginPage(),
      ),
    );
  }
}
