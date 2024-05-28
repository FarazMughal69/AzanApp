part of 'utility_export.dart';

class MyColors {
  static const Color lighttxtClr = Color.fromARGB(255, 224, 247, 250);
// const Color backgroundColor = Color.fromARGB(231, 30, 29, 29);
  static const Color darkbgColor = Color.fromARGB(255, 33, 33, 33);
  static const Color lightbgColor = Colors.white;
  static const Color darktxtClr = Color.fromRGBO(33, 33, 33, 1);
  static const Color darkactionColor = Color.fromARGB(255, 255, 223, 114);
  static const Color lightactionColor =
      Color.fromARGB(255, 30, 141, 245); //rgb(255, 223, 114)

  static Color backgroundColor() {
    return dark ? darkbgColor : lightbgColor;
  }

  static Color textColor({
    Color darkmodeClr = darktxtClr,
    Color lightModeClr = lighttxtClr,
  }) {
    return dark ? lightModeClr : darkmodeClr;
  }
}
