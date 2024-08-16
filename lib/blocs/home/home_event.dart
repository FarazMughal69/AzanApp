// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();
  @override
  List<Object> get props => [];
}

class HomeScrollingEvent extends HomeEvent {
  const HomeScrollingEvent();
}
