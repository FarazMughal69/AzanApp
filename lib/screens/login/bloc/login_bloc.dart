import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<ThemeChangeEvent>(themeChangeEvent);
  }

  FutureOr<void> themeChangeEvent(
      ThemeChangeEvent event, Emitter<LoginState> emit) {
    emit(ThemeChangeState(value: event.value));
  }
}
