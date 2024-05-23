import 'package:flutter/material.dart';

import 'constant_folder/utility_export.dart';
import 'screens/login/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;
bool dark = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return const MaterialApp(
      title: 'Azan App',
      themeMode: ThemeMode.system, // Use system theme mode
      home: MyLoginScreen(),
    );
  }
}
