part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ThemeChangeState extends LoginState {
  final bool value;
  ThemeChangeState({required this.value});
}
