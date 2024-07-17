part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class IntialThemeState extends ThemeState {
  final ThemeModes themeMode;

  const IntialThemeState({this.themeMode = ThemeModes.systemTheme});

  @override
  List<Object> get props => [themeMode];
}
