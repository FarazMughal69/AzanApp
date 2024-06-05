import 'package:flutter/material.dart';

import 'constant_folder/utility_export.dart';
import 'screens/login/ui/login_screen.dart';
import 'screens/signup/ui/signup.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;
bool dark = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azan App',
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => const MyLoginScreen(),
      //   '/signUp': (context) => const MySignUpScrren(),
      // },
      themeMode: ThemeMode.system, // Use system theme mode
      home: MyLoginScreen(),
    );
  }
}
