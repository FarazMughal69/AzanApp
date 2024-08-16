import 'package:azan/models/prayerdatamodels.dart';
import 'package:solar_icons/solar_icons.dart';

import '../extensions/extensions.dart';

class Utility {
  static List<PrayersData> getPrayersData(List<dynamic>? data) {
    try {
      List<PrayersData> prayersDataLst = [];
      if (data != null) {
        for (var element in data) {
          var p = PrayersData.fromJson(element);
          prayersDataLst.add(p);
        }
      }
      return prayersDataLst;
    } catch (e) {
      rethrow;
    }
  }

  static PrayersData extractTodayPrayerData(List<PrayersData> data) {
    PrayersData pd = PrayersData();
    DateTime now = DateTime.now();
    // getPrayersData(data);
    for (var item in data) {
      var date = item.date;
      var readAble = date!.readable.toString().toUpperCase();
      var todaydate = StringExtensions.readAbleDate(now);
      if (readAble == todaydate) {
        pd = PrayersData(
            timings: item.timings, date: item.date, meta: item.meta);
        return pd;

        //Add data in a list and save that list in the
      }
    }
    return pd;
  }

  // static List<PrayersData> getPrayersData(List<dynamic>? data) {
  //   List<PrayersData> pdLst = List.empty();
  //   for (var item in data!) {
  //     var p = PrayersData.fromJson(item);
  //     pdLst.add(p);
  //   }
  //   return pdLst;
  // }

  static (List<Prayers>, Date) getPrayerNameWithDateTime(PrayersData pd) {
    Date date = pd.date!;
    List<Prayers> pLst = <Prayers>[
      Prayers(
        prayerName: "Fajr",
        prayerTime: pd.timings!.fajr!,
        iconData: SolarIconsBold.moonFog,
      ),
      Prayers(
        prayerName: "Sunrise",
        prayerTime: pd.timings!.sunrise!,
        iconData: SolarIconsBold.sunrise,
      ),
      Prayers(
        prayerName: "Dhuhr",
        prayerTime: pd.timings!.dhuhr!,
        iconData: SolarIconsBold.sun2,
      ),
      Prayers(
        prayerName: "Asr",
        prayerTime: pd.timings!.asr!,
        iconData: SolarIconsBold.sun,
      ),
      Prayers(
        prayerName: "Sunset",
        prayerTime: pd.timings!.sunset!,
        iconData: SolarIconsBold.sunset,
      ),
      Prayers(
        prayerName: "Maghrib",
        prayerTime: pd.timings!.maghrib!,
        iconData: SolarIconsBold.cloudyMoon,
      ),
      Prayers(
        prayerName: "Isha",
        prayerTime: pd.timings!.isha!,
        iconData: SolarIconsBold.moon,
      ),
      Prayers(
        prayerName: "Imsak",
        prayerTime: pd.timings!.midnight!,
        iconData: SolarIconsBold.moonStars,
      ),
    ];
    return (pLst, date);
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
