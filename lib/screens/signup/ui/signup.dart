import 'package:flutter/material.dart';

import '../../../constant_folder/utility_export.dart';
import '../../login/ui/login_screen.dart';

class MySignUpScrren extends StatelessWidget {
  const MySignUpScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) {
            //     return const MyLoginScreen();
            //   }),
            // );
          },
          child: const Text('Login?'),
        ),
      ),
    );
  }
}
