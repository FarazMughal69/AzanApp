import 'dart:async';
import 'package:azan/models/prayermodel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../resourses/repo/api_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<ScrollEvent>(scrollEvent);
  }

  FutureOr<void> scrollEvent(ScrollEvent event, Emitter<HomeState> emit) {
    //https://api.aladhan.com/v1/calendarByAddress/2024/7?address=Lahore&method=2

    emit(const HomeScrollingState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    final ApiRepository apiRepository = ApiRepository();
    try {
      // ignore: unused_local_variable
      final response = await apiRepository.fetchPrayersTimings();
      emit(const HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoadedState(prayerTimings: response));
    } on NetworkError catch (ex) {
      emit(HomeErrorState(error: ex));
      print('Error $ex');
    }
  }
}
