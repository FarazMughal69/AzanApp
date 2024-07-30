import 'package:azan/models/prayermodel.dart';
import 'package:solar_icons/solar_icons.dart';

import '../extensions/readable_date.dart';

class Utility {
  static Timings extractTodayPrayerList(List<dynamic>? data) {
    Timings todayPrayers = Timings();
    DateTime now = DateTime.now();
    for (var item in data!) {
      var date = item['date'];
      var readAble = date['readable'].toString().toUpperCase();
      var todaydate = StringExtensions.readAbleDate(now);
      if (readAble == todaydate) {
        todayPrayers = Timings.fromJson(item['timings']);
        getPrayerNameWithTime(todayPrayers);
        return todayPrayers;

        //Add data in a list and save that list in the
      }
    }
    return todayPrayers;
  }

  static List<Prayers> getPrayerNameWithTime(Timings timings) {
    List<Prayers> pLst = <Prayers>[
      Prayers(
        prayerName: "Fajr",
        prayerTime: timings.fajr!,
        iconData: SolarIconsBold.moonFog,
      ),
      Prayers(
        prayerName: "Sunrise",
        prayerTime: timings.sunrise!,
        iconData: SolarIconsBold.sunrise,
      ),
      Prayers(
        prayerName: "Dhuhr",
        prayerTime: timings.dhuhr!,
        iconData: SolarIconsBold.sun2,
      ),
      Prayers(
        prayerName: "Asr",
        prayerTime: timings.asr!,
        iconData: SolarIconsBold.sun,
      ),
      Prayers(
        prayerName: "Sunset",
        prayerTime: timings.sunset!,
        iconData: SolarIconsBold.sunset,
      ),
      Prayers(
        prayerName: "Maghrib",
        prayerTime: timings.maghrib!,
        iconData: SolarIconsBold.cloudyMoon,
      ),
      Prayers(
        prayerName: "Isha",
        prayerTime: timings.isha!,
        iconData: SolarIconsBold.moon,
      ),
      Prayers(
        prayerName: "Imsak",
        prayerTime: timings.midnight!,
        iconData: SolarIconsBold.moonStars,
      ),
    ];
    return pLst;
  }

  // List<Prayers> prayerList = const [
//   Prayers(
//     prayerName: 'Fajir',
//     prayerTime: '04:30',
//     iconData: SolarIconsBold.moonFog,
//   ),
//   Prayers(
//     prayerName: 'Sunrise',
//     prayerTime: '05:30',
//     iconData: SolarIconsBold.sunrise,
//   ),
//   Prayers(
//     prayerName: 'Dhuhar',
//     prayerTime: '01:30',
//     iconData: SolarIconsBold.sun2,
//   ),
//   Prayers(
//     prayerName: 'Asar',
//     prayerTime: '04:30',
//     iconData: SolarIconsBold.sun,
//   ),
//   Prayers(
//     prayerName: 'Sunset',
//     prayerTime: '07:27',
//     iconData: SolarIconsBold.sunset,
//   ),
//   Prayers(
//     prayerName: 'Maghrib',
//     prayerTime: '07:30',
//     iconData: SolarIconsBold.cloudyMoon,
//   ),
//   Prayers(
//     prayerName: 'Isha',
//     prayerTime: '08:45',
//     iconData: SolarIconsBold.moonStars,
//   ),
// ];
}
