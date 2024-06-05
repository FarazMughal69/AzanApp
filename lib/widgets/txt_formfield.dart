// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azan/constant_folder/utility_export.dart';

class MyTextFormField extends StatefulWidget {
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
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 15),
          child: Icon(
            widget.leadingIcon,
            color: const Color.fromARGB(207, 101, 98, 98),
          ),
        ),
        Expanded(
          child: TextFormField(
            obscureText: widget.obscureText,
            obscuringCharacter: "*",
            style: Style.bodyTxtStyle(
              txtColor: const Color.fromARGB(255, 145, 144, 144),
            ),
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: Style.bodyTxtStyle(
                txtColor: const Color.fromRGBO(130, 126, 126, 0.58),
              ),
              suffix: widget.suffix
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
