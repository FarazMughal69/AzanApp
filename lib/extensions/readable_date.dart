import '../enums/months.dart';

extension StringExtensions on DateTime {
  static String readAbleDate(DateTime now) {
    String day = now.day.toString();
    String month = monthNumberToAbbreviation(now.month);
    String year = now.year.toString();

    return '$day $month $year';
  }
}

extension MonthExtension on Months {
  String toAbbreviation() {
    return toString().substring(7, 10).toUpperCase();
  }
}

String monthNumberToAbbreviation(int monthNumber) {
  if (monthNumber < 1 || monthNumber > 12) {
    throw ArgumentError('Invalid month number');
  }
  return Months.values[monthNumber - 1].toAbbreviation();
}
