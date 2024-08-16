// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeLoadedState extends HomeState {
  final List<Prayers> prayerTimingsList;
  final int index;
  final String hijriDate;
  final String nextPrayer;

  const HomeLoadedState({
    required this.prayerTimingsList,
    required this.index,
    required this.hijriDate,
    required this.nextPrayer,
  });
}

class HomeErrorState extends HomeState {
  final Error error;

  const HomeErrorState({required this.error});
}

class HomeScrollingState extends HomeState {
  const HomeScrollingState();
}
