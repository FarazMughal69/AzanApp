import 'package:flutter/material.dart';

import 'constant_folder/utility_export.dart';
import 'screens/login/ui/login_screen.dart';
import 'screens/signup/ui/signup.dart';

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
    return MaterialApp(
      title: 'Azan App',
      initialRoute: "/login",
      routes: {
        '/login': (context) => const MyLoginScreen(),
        '/signUp': (context) => const MySignUpScrren(),
      },
      themeMode: ThemeMode.system, // Use system theme mode
      home: const MyLoginScreen(),
    );
  }
}
