import 'package:dio/dio.dart';

import '../../models/prayermodel.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://api.aladhan.com/v1/calendarByAddress/2024/7?address=Lahore&method=2';

  Future<PrayerTimesResponse> fetchPrayersTimings() async {
    try {
      Response response = await _dio.get(_url);
      Map<String, dynamic> responseData = {};
      if (response.statusCode == 200) {
        responseData = response.data;
      }
      return PrayerTimesResponse.fromJson(responseData);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PrayerTimesResponse.withError("Data not found / Connection issue");
    }
  }
}
