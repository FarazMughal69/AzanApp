import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../main.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) {
      add(ScrollEvent());
    });

    on<ScrollEvent>(scrollEvent);
  }

  // FutureOr<void> homeInitialEvent(
  //     HomeInitialEvent event, Emitter<HomeState> emit) {
  //   ScrollController scrollController = ScrollController();
  //   ValueNotifier<double> opacityNotifier = ValueNotifier<double>(1.0);
  //   scrollController
  //       .addListener(scrollListener(scrollController, opacityNotifier, emit));
  // }

  VoidCallback scrollListener(ScrollController scrollController,
      ValueNotifier opacityNotifier, Emitter<HomeState> emit) {
    return () {
      double offset = scrollController.offset;
      double height = mq.height * 0.17;
      height = height - 50;
      opacityNotifier.value = 1 -
          (offset /
              height
                  .round()); // Adjust the scroll length for opacity transition
      if (opacityNotifier.value < 0) {
        opacityNotifier.value = 0;
      } // Ensure opacity doesn't go negative
    };
  }

  FutureOr<void> scrollEvent(ScrollEvent event, Emitter<HomeState> emit) {
    // double offset = event.scrollOffset;
    // double opacity = 0;
    // double height = mq.height * 0.17;
    // height = height - 50;
    // opacity = 1 -
    //     (offset /
    //         height.round()); // Adjust the scroll length for opacity transition
    // if (opacity < 0) opacity = 0;
    emit(const HomeScrollingState());
  }
}
