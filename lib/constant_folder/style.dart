// const Color backgroundColor = Color.fromARGB(255, 16, 16, 16);

part of 'utility_export.dart';

class Style {
  static TextStyle headerTxtStyle({Color txtColor = MyColors.lightModtxtClr}) {
    return GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: txtColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyTxtStyle({Color txtColor = MyColors.lightModtxtClr}) {
    return GoogleFonts.montserrat(
      decoration: TextDecoration.none,
      color: txtColor,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    );
  }
}
