import 'dart:async';

import 'package:azan/themeModes/theme_modes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const IntialThemeState()) {
    on<ToggleThemeEvent>(toggleThemeEvent);
  }
}

FutureOr<void> toggleThemeEvent(
    ToggleThemeEvent event, Emitter<ThemeState> emit) {
  emit(
    IntialThemeState(
      themeMode: event.newThemeMode,
    ),
  );
}
