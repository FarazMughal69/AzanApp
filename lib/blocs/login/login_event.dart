part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ThemeChangeEvent extends LoginEvent {
  final bool value;

  ThemeChangeEvent({required this.value});
}
