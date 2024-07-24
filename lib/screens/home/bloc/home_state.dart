part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeScrollingState extends HomeState {
  const HomeScrollingState();
}
