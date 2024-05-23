import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({super.key});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(),
    );
  }
}
