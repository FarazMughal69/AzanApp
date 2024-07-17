// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../themeModes/themes.dart';

class MyTextFormField extends StatelessWidget {
  final IconData leadingIcon;
  final bool obscureText;
  final String hintText;
  final bool suffix;
  final FocusNode node;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  const MyTextFormField({
    super.key,
    required this.leadingIcon,
    required this.obscureText,
    required this.hintText,
    this.suffix = false,
    required this.node,
    this.onEditingComplete,
    this.textInputAction,
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
            style: ThemeStyle.formFieldTxtStyle(
              fontSize: 14,
              txtColor: Theme.of(context).hintColor,
            ),
            textAlignVertical: TextAlignVertical.bottom,
            focusNode: node,
            onEditingComplete: onEditingComplete,
            textInputAction: textInputAction,
            enableSuggestions: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: ThemeStyle.formFieldTxtStyle(
                txtColor: ThemeStyle.lightIndicatorColor,
                fontSize: 14,
              ),
              suffix: suffix
                  ? GestureDetector(
                      onTap: () {},
                      child: Text('Show',
                          style: ThemeStyle.formFieldTxtStyle(
                            txtColor: ThemeStyle.lightIndicatorColor,
                            fontSize: 13,
                          )),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
