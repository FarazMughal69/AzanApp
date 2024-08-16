import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'utility_event.dart';
part 'utility_state.dart';

class UtilityBloc extends Bloc<UtilityEvent, UtilityState> {
  UtilityBloc() : super(UtilityInitialState()) {
    on<UtilityIntialEvent>((event, emit) {
      emit(UtilityHomeScrollingState());
    });
  }
}
