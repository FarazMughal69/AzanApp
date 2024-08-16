import 'package:azan/models/prayerdatamodels.dart';
import 'package:azan/resourses/api_provider/api.azan_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PrayerTimesResponse> fetchPrayersTimings() {
    return _provider.fetchPrayersTimings();
  }
}

class NetworkError extends Error {}
