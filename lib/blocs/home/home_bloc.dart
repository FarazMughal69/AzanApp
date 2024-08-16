import 'dart:async';
import 'package:azan/extensions/extensions.dart';
import 'package:azan/models/prayerdatamodels.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../resourses/repo/api_repository.dart';
import '../../utility/utility.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    // on<HomeScrollingEvent>(homeScrollingEvent);
  }

  FutureOr<void> homeScrollingEvent(
      HomeScrollingEvent event, Emitter<HomeState> emit) {
    //https://api.aladhan.com/v1/calendarByAddress/2024/7?address=Lahore&method=2

    emit(const HomeScrollingState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    final ApiRepository apiRepository = ApiRepository();
    try {
      List<PrayersData> pdLst = [];

      emit(const HomeLoadingState());
      final response = await apiRepository.fetchPrayersTimings();
      if (response.code == 200 && response.data != null) {
        pdLst = Utility.getPrayersData(response.data);
      }
      final PrayersData pd = Utility.extractTodayPrayerData(pdLst);
      final (List<Prayers>, Date) prayerRecord =
          Utility.getPrayerNameWithDateTime(pd);
      var date = prayerRecord.$2.gregorian!.date;

      String hijriDate =
          '${prayerRecord.$2.hijri!.day} ${prayerRecord.$2.hijri!.month!.en} ${prayerRecord.$2.hijri!.year} ${prayerRecord.$2.hijri!.designation!.abbreviated}';

      // Finding prayer time index for show active index in Prayers Time ListTile
      int activeIndex = 0;
      var dateTimenow = DateTime.now();
      String nextPrayer = 'next Prayer';
      // Loop on the List of the prayers of the day
      for (var i = 0; i < prayerRecord.$1.length; i++) {
        // If this is Last index of the prayerList then active Index is the last index and break the loop
        // because below the condition checking the next index prayer time that will cause exception
        if (prayerRecord.$1[i] == prayerRecord.$1.last) {
          activeIndex = i;
          break;
        }
        //convert the string to the DateTime
        DateTime currentPrayertime = StringToDateTime.convertStringToDateTime(
            '$date ${prayerRecord.$1[i].prayerTime.substring(0, 5)}:00.000');

        DateTime upComingPrayerTime = StringToDateTime.convertStringToDateTime(
            '$date ${prayerRecord.$1[i + 1].prayerTime.substring(0, 5)}:00.000');
        nextPrayer = prayerRecord.$1[i + 1].prayerName;
        // if (the DateTime.now is greater that current prayer time and Less than next prayer Time)
        if (dateTimenow.isAfter(currentPrayertime) &&
            dateTimenow.isBefore(upComingPrayerTime)) {
          activeIndex = i;
          break;
        }
      }
      // Add the relevent states for the next prayer in state is RemainingTimeCounterState
      // fetch the time for one time and save in the local data base
      // fetch once in the month when the internet is available
      // add independent states and event to handle the events
      // await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoadedState(
        prayerTimingsList: prayerRecord.$1,
        index: activeIndex,
        hijriDate: hijriDate,
        nextPrayer: nextPrayer,
      ));
    } on NetworkError catch (ex) {
      emit(HomeErrorState(error: ex));
      // print('Error $ex');
    }
  }
}
