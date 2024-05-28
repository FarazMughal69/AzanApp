// const Color backgroundColor = Color.fromARGB(255, 16, 16, 16);

part of 'utility_export.dart';

class Style {
  static TextStyle headerTxtStyle({Color txtColor = MyColors.lighttxtClr}) {
    return GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: txtColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyTxtStyle(
      {Color txtColor = MyColors.lighttxtClr, double fontSize = 15}) {
    return GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: txtColor,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
  }
}
