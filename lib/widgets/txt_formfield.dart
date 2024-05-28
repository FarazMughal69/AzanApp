// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:azan/constant_folder/utility_export.dart';

class MyTextFormField extends StatelessWidget {
  final IconData leadingIcon;
  final bool obscureText;
  final String hintText;
  final bool suffix;
  const MyTextFormField({
    super.key,
    required this.leadingIcon,
    required this.obscureText,
    required this.hintText,
    this.suffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 15),
          child: Icon(
            leadingIcon,
            color: const Color.fromARGB(207, 101, 98, 98),
          ),
        ),
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            obscuringCharacter: "*",
            style: Style.bodyTxtStyle(
              txtColor: MyColors.textColor(),
            ),
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Style.bodyTxtStyle(
                txtColor: const Color.fromRGBO(130, 126, 126, 0.58),
              ),
              suffix: suffix
                  ? GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Show',
                        style: Style.bodyTxtStyle(
                          txtColor: const Color.fromARGB(148, 130, 126, 126),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
