part of 'theme_bloc.dart';

enum SwitchState { on, off }

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {
  final ThemeModes newThemeMode;

  const ToggleThemeEvent({required this.newThemeMode});

  @override
  List<Object> get props => [newThemeMode];
}
