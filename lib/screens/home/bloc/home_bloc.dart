import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) {
      emit(const HomeInitialState());
    });
    on<ScrollEvent>(scrollEvent);
  }

  FutureOr<void> scrollEvent(ScrollEvent event, Emitter<HomeState> emit) {
    emit(const HomeScrollingState());
  }
}
