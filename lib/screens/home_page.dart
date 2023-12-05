import 'package:flutter/material.dart';
import 'package:mi_medio_pasaje/components/navigator_drawer.dart';
import 'package:mi_medio_pasaje/helpers/dialog_helper.dart';
import 'package:mi_medio_pasaje/screens/camera_page.dart';
import 'package:mi_medio_pasaje/screens/data_complaint_page.dart';
import 'package:mi_medio_pasaje/screens/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MiMedioPasaje',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Image.asset(
                  'lib/assets/MedioPasaje.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              style: CustomButtonStyle(colorScheme: colorScheme).style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ),
                );
              },
              child: const Text('Grabar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: CustomButtonStyle(colorScheme: colorScheme).style,
              onPressed: () async {
                DialogUtils.showLoadingDialog(context);

                Navigator.pop(context);
                //final videoPath = await FilePickerService.pickVideo();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataComplaint(),
                  ),
                );
              },
              child: const Text('Adjuntar data'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}

class CustomButtonStyle {
  final ColorScheme colorScheme;

  CustomButtonStyle({required this.colorScheme});

  ButtonStyle get style {
    return ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
